//
//  TimeLineWithImageCell.h
//  V-LOVE
//
//  Created by mac on 15/10/30.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeModel.h"
#import "ZoomImageView.h"

@interface TimeLineWithImageCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *monthLabel;
@property (strong, nonatomic) IBOutlet UILabel *dayLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet ZoomImageView *photoImageView;


@property (nonatomic, strong) TimeModel *model;

@end
