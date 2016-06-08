//
//  LifeTopicTableViewCell.h
//  V_LOVE
//
//  Created by Tony on 15/10/27.
//  Copyright © 2015年 zhengyiqun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeModel.h"

@interface LifeTopicTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *LifeTopicImageView;
@property (weak, nonatomic) IBOutlet UILabel *LifeTopicTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *LifeTopicSubheadingLabel;
@property (weak, nonatomic) IBOutlet UILabel *LifeTopicCommentamount;

@property (nonatomic, strong) LifeModel *model;

@end
