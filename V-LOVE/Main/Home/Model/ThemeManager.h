//
//  ThemeManager.h
//  V-LOVE
//
//  Created by mac on 15/10/26.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeManager : NSObject
@property (nonatomic,copy) NSString *themeName; //主题名字

+ (ThemeManager *)shareInstance;//单例方法

- (UIColor *)getThemeColor:(NSString *)colorName;

@end
