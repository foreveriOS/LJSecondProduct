//
//  LifeArderTableViewCell.m
//  V-LOVE
//
//  Created by Tony on 15/10/28.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import "LifeArderTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation LifeArderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(LifePlayModel *)model
{
    if (_model != model)
    {
        _model = model;
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    //调用 父类 布局
    [super layoutSubviews];
    
    //属性赋值
    //01 菜图
    NSString *main_url = _model.cover[@"main_url"];
    [_LifeArderImageView sd_setImageWithURL:[NSURL URLWithString:main_url]];
    //02 标题
    _titleLabel.text = _model.title;
    //03 用户头像
    _userImageView.layer.cornerRadius = 20;
    _userImageView.clipsToBounds = YES;
    [_userImageView sd_setImageWithURL:[NSURL URLWithString:_model.headurl]];
    //04 用户名称
    _userNameLabel.text = _model.user_name;
    //05 介绍
    _LifeArderLabel.text = _model.reason;
    //05 赞
    _bgImageView.layer.cornerRadius = 20;
    _bgImageView.clipsToBounds = YES;

    _loveCount.text = [NSString stringWithFormat:@"%@",_model.like_count];

    [_loveButton setImage:[UIImage imageNamed:@"selected_3"] forState:UIControlStateNormal];

}



@end
