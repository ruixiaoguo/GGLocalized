//
//  LocalizidManager.m
//  LocalizedDemo
//
//  Created by grx on 2021/4/23.
//  Copyright © 2021 Ashen<http://www.devashen.xyz>. All rights reserved.
//

#import "LocalizidManager.h"
static NSString *appLanguage = @"appLanguage";

@implementation LocalizidManager
+ (LocalizidManager *)shared{
    static LocalizidManager *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[LocalizidManager alloc]init];
    });
    return object;
}

- (void)initLangueage {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:appLanguage]) {
        NSArray  *languages = [NSLocale preferredLanguages];
        NSString *language = [languages objectAtIndex:0];
        if ([language hasPrefix:@"zh-Hans"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:appLanguage];
        } else if ([language hasPrefix:@"zh-TW"] || [language hasPrefix:@"zh-HK"] || [language hasPrefix:@"zh-Hant"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hant" forKey:appLanguage];
        } else if ([language hasPrefix:@"en"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:appLanguage];
        }else{
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:appLanguage];
        }
    }
}
/** 选择语言 */
- (void)selectLangueage:(NSString *)lan{
    [[NSUserDefaults standardUserDefaults] setObject:lan forKey:appLanguage];
}

@end
