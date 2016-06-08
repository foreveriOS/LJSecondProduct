//
//  BaseViewController.h
//  V-LOVE
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 XXX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"
#import "MaskWindow.h"

@interface BaseViewController : UIViewController
@property (nonatomic, strong)MaskWindow *maskWindow;
@property (nonatomic, strong) UILabel *titleLabel;

- (void)UseNSUserDefaults:(NSData *)data forKey:(NSString *)name;
- (void)creatSubView:(NSString *)titleLabel forKey:(NSString *)theKey;

- (void)createNavigationButtonWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName withSide:(NSString *)side frame:(CGRect)frame action:(SEL)action;


@end
