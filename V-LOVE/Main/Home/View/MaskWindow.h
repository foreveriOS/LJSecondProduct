//
//  MaskWindow.h
//  V-LOVE
//
//  Created by mac on 15/10/23.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"
typedef void(^myBlock)(NSString *str);

@interface MaskWindow : UIWindow
{
    NSDate *_date;
}
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong)UIDatePicker *datePicker;
@property (nonatomic,strong)NSString *str;

@property (nonatomic, copy) myBlock block;

@end
