//
//  MyView.m
//  V-LOVE
//
//  Created by mac on 15/10/22.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "MyView.h"
#import "MaskWindow.h"

@implementation MyView
- (void)setTitleLabel:(NSString *)titleLabel
{
    if (![_titleLabel isEqualToString:titleLabel])
    {
        _titleLabel = titleLabel;
        _label2.text = titleLabel;
    }
}

- (void)setDateLabel:(NSString *)dateLabel
{
    if (![_dateLabel isEqualToString:dateLabel]) {
        _dateLabel = [dateLabel copy];

        _label3.text = dateLabel;
    }
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self _createSubViews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubViews];
    }
    return self;
}

- (void)_createSubViews
{
    self.backgroundColor = [UIColor whiteColor];
    UIView *lineView1 = [[UIView alloc]initWithFrame:CGRectMake(10, 50, KScreenWidth - 20, 1)];
    lineView1.backgroundColor = [UIColor redColor];
    [self addSubview:lineView1];
    
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(10, 95, KScreenWidth - 20, 1)];
    lineView2.backgroundColor = [UIColor grayColor];
    [self addSubview:lineView2];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100, 50)];
    label1.text = @"纪念日";
    label1.textAlignment = NSTextAlignmentLeft;
    [self addSubview:label1];
    
    _label2 = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, KScreenWidth - 120, 50)];
    _label2.textAlignment = NSTextAlignmentRight;
    [self addSubview:_label2];
    
    _label3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, KScreenWidth - 20, 50)];
    _label3.textAlignment = NSTextAlignmentRight;
    [self addSubview:_label3];

}

@end
