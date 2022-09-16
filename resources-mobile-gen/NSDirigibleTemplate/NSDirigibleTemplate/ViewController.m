//
//  ViewController.m
//  NSDirigibleTemplate
//
//  Created by Dermendzhiev, Teodor (external - Project) on 5.10.21.
//

#import "ViewController.h"
#import <NativeScript/NativeScript.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]
            addObserver:self
            selector:@selector(messagePosted:)
            name:@"ns-message-posted"
            object:nil];
    
    _webview.navigationDelegate = self;
    
    NSURL *targetURL = [NSURL URLWithString:@"APP_URL"];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [_webview loadRequest:request];
    [_webview.configuration.userContentController addScriptMessageHandler:self name:@"executor"];
    [_webview.configuration.userContentController addScriptMessageHandler:self name:@"terminator"];
    [_webview.configuration.userContentController addScriptMessageHandler:self name:@"postMessageListener"];
    
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
    if ([message.name  isEqual: @"executor"]) {
//        [NativeScript reinitialize];
        [NativeScript runScriptString: message.body];
    }
    
    if ([message.name  isEqual: @"terminator"]) {
//        [NativeScript terminate];
    }
    
    if ([message.name  isEqual: @"postMessageListener"]) {
        NSString* scr = [NSString stringWithFormat:@"onmessage(%@)", message.body];
        [NativeScript runScriptString:scr];
    }
}

- (void) messagePosted:(NSNotification*)notification {
    if ([notification.object isKindOfClass:[NSString class]]) {
        [_webview evaluateJavaScript:[NSString stringWithFormat:@"onNativeMessage(%@)", notification.object] completionHandler:NULL];
    }

}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [_webview evaluateJavaScript:[self getWorkerScript] completionHandler:^(id _Nullable res, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", [error debugDescription]);
        }
    }];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]
        removeObserver:self];
}

-(NSString*) getWorkerScript {
    return @"class NSWorker {\r\n\r\n    constructor(script) {\r\n        this.script = script;\r\n        this.onerror = null;\r\n        this.onmessage = null;\r\n        this.onmessageerror = null;\r\n        this.execute();\r\n    }\r\n\r\n    postMessage(msg) {\r\n        if (window && window.webkit) {\r\n            window.webkit.messageHandlers.postMessageListener.postMessage(msg);\r\n        } else {\r\n            console.log(\"No webkit\")\r\n        }\r\n    }\r\n\r\n    execute() {\r\n        if (window && window.webkit) {\r\n            window.webkit.messageHandlers.executor.postMessage(this.script);\r\n        } else {\r\n            console.log(\"No webkit\")\r\n        }\r\n    }\r\n\r\n    terminate() {\r\n        if (window && window.webkit) {\r\n            window.webkit.messageHandlers.terminator.postMessage(this.script);\r\n        } else {\r\n            console.log(\"No webkit\")\r\n        }\r\n    }\r\n\r\n}\r\n\r\nlet onNativeMessage = function(msg) {\r\n    console.log(\"Message from native: \" + msg)\r\n}";
}


@end

