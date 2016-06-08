//
//  LifeTopicDetailsTableView.h
//  V-LOVE
//
//  Created by Tony on 15/10/28.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeDetailModel.h"
#import "LifeModel.h"
@interface LifeTopicDetailsTableView : UITableView <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) LifeModel *lifeModel;

@end
