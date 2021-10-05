//
//  ViewController.h
//  NSDirigibleTemplate
//
//  Created by Dermendzhiev, Teodor (external - Project) on 5.10.21.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController <WKScriptMessageHandler, WKNavigationDelegate>
@property (weak, nonatomic) IBOutlet WKWebView *webview;


@end

