//
//  LifeProfileTableViewCell.m
//  V_LOVE
//
//  Created by apple on 15/10/17.
//  Copyright (c) 2015年 zhengyiqun. All rights reserved.
//

#import "LifeProfileTableViewCell.h"

@implementation LifeProfileTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _createCell];

    }
    return self;
}

- (void)_createCell
{
    _LifeProfileImageView = [[UIImageView alloc]initWithFrame:CGRectMake(26, 9, 26, 26)];
    _LifeProfileText = [[UILabel alloc]initWithFrame:CGRectMake(78, 0, 200, 44)];
    _LifeProfileText.textAlignment = NSTextAlignmentLeft;
    _LifeProfileText.font = [UIFont systemFontOfSize:16];
    _LifeProfileText.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:_LifeProfileText];
    [self.contentView addSubview:_LifeProfileImageView];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
