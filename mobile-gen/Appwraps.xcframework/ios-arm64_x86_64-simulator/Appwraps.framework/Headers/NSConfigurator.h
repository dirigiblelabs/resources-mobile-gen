//
//  NSConfigurator.h
//  Appwraps
//
//  Created by Teodor Dermendzhiev on 9.09.22.
//

#import <Foundation/Foundation.h>
//https://medium.com/@hello_73586/how-to-import-objective-c-framework-in-swift-framework-eeb731231099

@class NativeScript;


NS_ASSUME_NONNULL_BEGIN

@interface NSConfigurator : NSObject

+(NativeScript*)start;

@end

NS_ASSUME_NONNULL_END
