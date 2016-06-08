//
//  TimeLineWithImageCell.m
//  V-LOVE
//
//  Created by mac on 15/10/30.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import "TimeLineWithImageCell.h"
#import "CoreDataManager.h"
#import "Spirit.h"

@implementation TimeLineWithImageCell

- (void)awakeFromNib {
    self.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
}

- (void)setModel:(TimeModel *)model
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
    
    _photoImageView.image = [UIImage imageWithData:_model.imageData];
    _photoImageView.contentMode = UIViewContentModeScaleAspectFill;
    _photoImageView.clipsToBounds = YES;
    
    _monthLabel.text = _model.month;
    _dayLabel.text = _model.day;
    _timeLabel.text = _model.time;
    
    if (_model.month == nil) {
        //获取时间
        NSDate *now = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSUInteger unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
        NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
        ;
        //01 月、日
        _monthLabel.text = [NSString stringWithFormat:@"%li",dateComponent.month];
        _dayLabel.text = [NSString stringWithFormat:@"%li",dateComponent.day];
        //02 几点几分
        NSUInteger hour = dateComponent.hour;
        NSUInteger minute = dateComponent.minute;
        _timeLabel.text = [NSString stringWithFormat:@"%li:%li",hour,minute];
    }
    
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
