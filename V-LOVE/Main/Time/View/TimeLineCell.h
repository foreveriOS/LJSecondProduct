//
//  TimeLineCell.h
//  V-LOVE
//
//  Created by mac on 15/10/18.
//  Copyright (c) 2015年 XXX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeModel.h"

@interface TimeLineCell : UITableViewCell

@property (nonatomic, strong) TimeModel *model;

@property (strong, nonatomic) IBOutlet UILabel *monthLabel;
@property (strong, nonatomic) IBOutlet UILabel *dayLabel;
@property (strong, nonatomic) IBOutlet UIImageView *bgImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;


@end
