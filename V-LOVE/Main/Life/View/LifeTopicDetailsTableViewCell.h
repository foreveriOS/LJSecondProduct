//
//  LifeTopicDetailsTableViewCell.h
//  V-LOVE
//
//  Created by Tony on 15/10/28.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeDetailModel.h"

@interface LifeTopicDetailsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *LifeTopicDetailsTitle;
@property (weak, nonatomic) IBOutlet UILabel *LifeTopicDetailsName;
@property (weak, nonatomic) IBOutlet UILabel *LifeTopicDetailsComments;

@property (nonatomic, strong) LifeDetailModel *model;

@end
