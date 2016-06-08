//
//  LifeTopicTableView.h
//  V_LOVE
//
//  Created by apple on 15/10/24.
//  Copyright (c) 2015年 zhengyiqun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LifeTopicTableView : UITableView <UITableViewDataSource,UITableViewDelegate>



@property (nonatomic, strong) NSArray *data1;
@property (nonatomic, strong) NSArray *data2;

@property (nonatomic, assign) NSInteger index;

@end
