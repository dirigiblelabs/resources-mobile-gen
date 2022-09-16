//
//  WDBSetWebSecurityEnabled.m
//  DirigibleMobile
//
//  Created by Dermendzhiev, Teodor (external - Project) on 21.09.21.
//

@import WebKit;
@import ObjectiveC;

void WKPreferencesSetWebSecurityEnabled(id, bool);

@interface WDBFakeWebKitPointer: NSObject
@property (nonatomic) void* _apiObject;
@end
@implementation WDBFakeWebKitPointer
@end

void WDBSetWebSecurityEnabled(WKPreferences* prefs, bool enabled) {
    Ivar ivar = class_getInstanceVariable([WKPreferences class], "_preferences");
    void* realPreferences = (void*)(((uintptr_t)prefs) + ivar_getOffset(ivar));
    WDBFakeWebKitPointer* fake = [WDBFakeWebKitPointer new];
    fake._apiObject = realPreferences;
    WKPreferencesSetWebSecurityEnabled(fake, enabled);
}
