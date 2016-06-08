//
//  MaskWindow.m
//  V-LOVE
//
//  Created by mac on 15/10/23.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "MaskWindow.h"
#import "MyView.h"
@implementation MaskWindow

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _creatMaskWindow];
        self.windowLevel = UIWindowLevelStatusBar;
    }
    return self;
}
- (void)_creatMaskWindow{
    MyView *view =[[MyView alloc]init];
    view.dateLabel = @"123";
    self.backgroundColor = [UIColor grayColor];
    self.alpha = 0.8;
    
   UIView *datePickerView  = [[UIView alloc]initWithFrame:CGRectMake(10,300, KScreenWidth - 20, 250)];
    datePickerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:datePickerView];
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, (KScreenWidth - 20) / 2, 50)];
    [leftButton setTitle:@"取消" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [datePickerView addSubview:leftButton];
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake((KScreenWidth - 20) / 2, 200, (KScreenWidth - 20) / 2, 50)];
    [rightButton setTitle:@"确定" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(selectDate) forControlEvents:UIControlEventTouchUpInside];
    [leftButton addTarget:self action:@selector(cancelselectDate) forControlEvents:UIControlEventTouchUpInside];
    
    [datePickerView addSubview:rightButton];

    _datePicker = [[UIDatePicker alloc]init];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    [_datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
    [_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    [datePickerView addSubview:_datePicker];
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self addGestureRecognizer:tap];
    
}

- (void)tapAction{
    self.hidden = YES;
}
-(void)dateChanged:(UIDatePicker *)sender{
    _date = sender.date;

}

- (void)selectDate{


    if (_date != nil) {
        NSString *string = [NSString stringWithFormat:@"%@",_date];
        _str = [string substringToIndex:11];
        
        _block(_str);
        if (self.index == 1) {
            [self storeObject:_str forKey:KDayTime];
        }else if (self.index == 2){
            [self storeObject:_str forKey:KBirthdayTime];
        }else if (self.index == 3){
            [self storeObject:_str forKey:KTogetherTime];
        }else if (self.index == 4){
            [self storeObject:_str forKey:KhugTime];
        }else if (self.index == 5){
            [self storeObject:_str forKey:KKissTime];
        }else if (self.index == 6){
            [self storeObject:_str forKey:KmarryTime];
        }
        
    }
    self.hidden = YES;
}
- (void)cancelselectDate{
    self.hidden = YES;
}
- (void)storeObject:(id)Obj forKey:(NSString *)theKey
{
    [[NSUserDefaults standardUserDefaults] setObject:Obj forKey:theKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
