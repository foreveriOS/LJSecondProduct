//
//  CommemorationViewController.m
//  微爱
//
//  Created by mac on 15/10/9.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "CommemorationViewController.h"
#import "DayViewController.h"
#import "BirthdayViewController.h"
#import "TogetherViewController.h"
#import "KissViewController.h"
#import "HugViewController.h"
#import "MarryViewController.h"
@interface CommemorationViewController (){
    UITableView *_table;
}

@end

@implementation CommemorationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTableView];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)creatTableView{
    _table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _table.dataSource = self;
    _table.delegate = self;
    _table.backgroundColor = [UIColor whiteColor];
    _table.separatorStyle = NO;
    _table.backgroundColor = [UIColor clearColor];
    _table.sectionFooterHeight = 5;
    [self.view addSubview:_table];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;{
    NSArray *array = @[@"我的的生日",
                       @"TA的生日",@"在一起的日子",@"第一次拥抱的日子",@"第一次接吻的日子",@"结婚纪念日"];
    NSArray *imageNames = @[@"an_unset_mark_birth_b@2x",@"an_unset_mark_birth_r@2x",@"an_unset_mark_meet@2x",@"an_unset_mark_hug@2x",@"an_unset_mark_kiss@2x",@"an_unset_mark_marry@2x"];
    NSArray *imageArray = @[@"an_unset_right_plus_red@2x",@"an_unset_right_plus_blue@2x",@"an_unset_right_plus_green@2x",@"an_unset_right_plus_green",@"an_unset_right_plus_green@2x",@"an_unset_right_plus_green@2x"];
    static NSString *indentifil = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifil];
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = NO;
    cell.imageView.image = [UIImage imageNamed:imageNames[indexPath.section]];
    cell.textLabel.text = array[indexPath.section];
    for (int i = 0; i < indexPath.section + 1; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth - 52, 19, 22, 22)];
        imageView.image = [UIImage imageNamed:imageArray[i]];
        [cell addSubview:imageView];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        DayViewController *day = [[DayViewController alloc]init];
        [self.navigationController pushViewController:day animated:YES];
    }else if(indexPath.section == 1){
        BirthdayViewController *birthday = [[BirthdayViewController alloc]init];
        [self.navigationController pushViewController:birthday animated:YES];
    }else if(indexPath.section == 2){
        TogetherViewController *together = [[TogetherViewController alloc]init];
        [self.navigationController pushViewController:together animated:YES];
    }else if(indexPath.section == 3){
        HugViewController *hug = [[HugViewController alloc]init];
        [self.navigationController pushViewController:hug animated:YES];
    }else if(indexPath.section == 4){
        KissViewController *kiss = [[KissViewController alloc]init];
        [self.navigationController pushViewController:kiss animated:YES];
    }else if(indexPath.section == 5){
        MarryViewController *marry = [[MarryViewController alloc]init];
        [self.navigationController pushViewController:marry animated:YES];
    }
}

@end
