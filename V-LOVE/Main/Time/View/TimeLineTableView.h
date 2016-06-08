//
//  TimeLineTableView.h
//  V-LOVE
//
//  Created by mac on 15/10/25.
//  Copyright (c) 2015年 XXX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeModel.h"

@interface TimeLineTableView : UITableView<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy) NSString *sendInfo;

@property (nonatomic, strong) NSMutableArray *data;

@end
