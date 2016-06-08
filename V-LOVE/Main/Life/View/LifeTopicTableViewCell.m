//
//  LifeTopicTableViewCell.m
//  V_LOVE
//
//  Created by Tony on 15/10/27.
//  Copyright © 2015年 zhengyiqun. All rights reserved.
//

#import "LifeTopicTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation LifeTopicTableViewCell



- (void)awakeFromNib {
    // Initialization code

}

- (void)setModel:(LifeModel *)model
{
    if (_model != model)
    {
        _model = model;
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_LifeTopicImageView sd_setImageWithURL:[NSURL URLWithString:_model.image_url]];
    _LifeTopicTitleLabel.text = _model.name;
    _LifeTopicSubheadingLabel.text = _model.desc;
    _LifeTopicCommentamount.text = [_model.heat stringValue];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
