//
//  LifeTopicDetailsTableViewCell.m
//  V-LOVE
//
//  Created by Tony on 15/10/28.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import "LifeTopicDetailsTableViewCell.h"


@implementation LifeTopicDetailsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(LifeDetailModel *)model
{
    if (_model != model)
    {
        _model = model;
        [self setNeedsLayout];
    }
}
/*
 UILabel *LifeTopicDetailsTitle;
 @property (weak, nonatomic) IBOutlet UILabel *LifeTopicDetailsName;
 @property (weak, nonatomic) IBOutlet UILabel *LifeTopicDetailsComments;
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    _LifeTopicDetailsTitle.text = _model.title;
    _LifeTopicDetailsName.text = _model.user_name;
    _LifeTopicDetailsComments.text = [NSString stringWithFormat:@"%@",_model.comment_count];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
