//
//  LifeArderTableViewCell.h
//  V-LOVE
//
//  Created by Tony on 15/10/28.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifePlayModel.h"

@interface LifeArderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *LifeArderImageView;
@property (weak, nonatomic) IBOutlet UILabel *LifeArderLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *loveButton;
@property (weak, nonatomic) IBOutlet UILabel *loveCount;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;


@property (nonatomic, strong) LifePlayModel *model;

@end
