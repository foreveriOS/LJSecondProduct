//
//  LifeProfileViewController.m
//  V_LOVE
//
//  Created by apple on 15/10/17.
//  Copyright (c) 2015年 zhengyiqun. All rights reserved.
//

#import "LifeProfileViewController.h"
#import "LifeProfileTableViewCell.h"
#import "NoticeViewController.h"
#import "SelectViewController.h"
#import "TellMeViewController.h"

@interface LifeProfileViewController ()
{
    UITableView * _profileTableView;
}   
@end

@implementation LifeProfileViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"个人中心";
    [self _createTableView];
//    self.navigationController.bar
}

- (void)_createTableView
{
    _profileTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStyleGrouped];
    _profileTableView.delegate = self;
    _profileTableView.dataSource = self;
    _profileTableView.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    [self.view addSubview:_profileTableView];
    
    [_profileTableView registerClass:[LifeProfileTableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview协议
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    LifeProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = NO;
    if (indexPath.section == 0) {
        cell.LifeProfileText.text = @"bababa";
        cell.accessoryType = UITableViewCellAccessoryNone;
//        cell.LifeProfileImageView.image = [UIImage imageNamed:@"profile_1@3x"];
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.LifeProfileText.text = @"我发布的";
            cell.LifeProfileImageView.image = [UIImage imageNamed:@"profile_1@3x"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 1){
            cell.LifeProfileText.text = @"我收藏的";
            cell.LifeProfileImageView.image = [UIImage imageNamed:@"profile_2@3x"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }else if (indexPath.section == 2){
        cell.LifeProfileText.text = @"TA告诉我";
        cell.LifeProfileImageView.image = [UIImage imageNamed:@"profile_3@3x"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 60;
    }else{
        return 44;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1){
        if (indexPath.row == 0) {
            NoticeViewController * NoticeVC = [[NoticeViewController alloc]init];
            [self.navigationController pushViewController:NoticeVC animated:YES];
        }else if (indexPath.row == 1){
            SelectViewController * SelectVC = [[SelectViewController alloc]init];
            [self.navigationController pushViewController:SelectVC animated:YES];
        }
    }else if (indexPath.section == 2){
        TellMeViewController * TellMeVC = [[TellMeViewController alloc]init];
        [self.navigationController pushViewController:TellMeVC animated:YES];
    }
}

/*
#pragma mark - Navigation

 In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     Get the new view controller using [segue destinationViewController].
     Pass the selected object to the new view controller.
}
*/

@end
