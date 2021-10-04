//
//  CorsDisable.h
//  DirigibleMobile
//
//  Created by Dermendzhiev, Teodor (external - Project) on 21.09.21.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CorsDisable : NSObject

+(void)disableCors: (WKPreferences*)prefs;

@end

NS_ASSUME_NONNULL_END
