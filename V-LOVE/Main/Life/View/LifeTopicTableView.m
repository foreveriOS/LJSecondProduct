//
//  LifeTopicTableView.m
//  V_LOVE
//
//  Created by apple on 15/10/24.
//  Copyright (c) 2015年 zhengyiqun. All rights reserved.
//

#import "LifeTopicTableView.h"
#import "LifeTopicTableViewCell.h"
#import "LifeModel.h"
#import "UIView+UIViewController.h"
#import "LifeTopicDetailsViewController.h"
#import "LifeArderViewController.h"

@implementation LifeTopicTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {

        
        self.delegate = self;
        self.dataSource = self;
        UINib * nib = [UINib nibWithNibName:@"LifeTopicTableViewCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellReuseIdentifier:@"cell"];
        
    }
    return self;
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (self.index == 1000)
    {
        return _data1.count;
    }
    else
    {
        return _data2.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LifeTopicTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.index == 1000)
    {
        LifeModel *model = _data1[indexPath.row];
        cell.model = model;
        return cell;
    }
    else
    {
        LifeModel *model = _data2[indexPath.row];
        cell.model = model;
        return cell;
    }
   
}

#pragma mark - UITableViewDelegate;
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //行高 设置
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //选中单元格事件
    if (self.index == 1000)
    {
        //push 到 话题小组
        LifeTopicDetailsViewController * vc = [[LifeTopicDetailsViewController alloc]init];
        LifeModel *model = _data1[indexPath.row];
        vc.model = model;
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        //push 到 吃喝玩乐
        LifeArderViewController * vc = [[LifeArderViewController alloc]init];
        LifeModel *model = _data2[indexPath.row];
        vc.model = model;
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
}
@end
