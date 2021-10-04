//
//  CorsDisable.m
//  DirigibleMobile
//
//  Created by Dermendzhiev, Teodor (external - Project) on 21.09.21.
//

#import "CorsDisable.h"
#import "WDBSetWebSecurityEnabled.h"
#import <WebKit/WebKit.h>

@implementation CorsDisable

+(void)disableCors: (WKPreferences*)prefs {
    WDBSetWebSecurityEnabled(prefs, false);
}

@end
