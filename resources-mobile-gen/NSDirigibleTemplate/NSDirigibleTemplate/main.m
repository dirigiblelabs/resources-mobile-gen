//
//  main.m
//  NSDirigibleTemplate
//
//  Created by Dermendzhiev, Teodor (external - Project) on 5.10.21.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NativeScript/NativeScript.h"

extern char startOfMetadataSection __asm("section$start$__DATA$__TNSMetadata");

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        void* metadataPtr = &startOfMetadataSection;
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        bool isDebug =
#ifdef DEBUG
            true;
#else
            false;
#endif

        
        Config* config = [[Config alloc] init];
        config.IsDebug = isDebug;
        config.LogToSystemConsole = isDebug;
        config.MetadataPtr = metadataPtr;
        config.ArgumentsCount = argc;
        config.Arguments = argv;

        [NativeScript initialize:config];
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
