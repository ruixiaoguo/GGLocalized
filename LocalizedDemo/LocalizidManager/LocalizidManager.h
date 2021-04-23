//
//  LocalizidManager.h
//  LocalizedDemo
//
//  Created by grx on 2021/4/23.
//  Copyright © 2021 Ashen<http://www.devashen.xyz>. All rights reserved.
//

#import <Foundation/Foundation.h>
#define ASLocalizedString(key)  [NSString stringWithFormat:@"%@", [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]] ofType:@"lproj"]] localizedStringForKey:(key) value:nil table:@"ASLocalized"]]
NS_ASSUME_NONNULL_BEGIN

@interface LocalizidManager : NSObject
+ (LocalizidManager *)shared;
/** 设置默认语言 */
- (void)initLangueage;
/** 选择语言 */
- (void)selectLangueage:(NSString *)lan;
@end

NS_ASSUME_NONNULL_END
