//
//  setViewController.m
//  微爱
//
//  Created by mac on 15/10/7.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "setViewController.h"
#import "personalViewController.h"
#import "ThemeColourViewController.h"
#import "HeadViewController.h"
#import "HelpCentreViewController.h"
#import "AboutUsViewController.h"

@interface setViewController (){
    UITableView *_table;

}

@end

@implementation setViewController

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
    [self creatTableView];
    self.title = @"设置";
}

- (void)creatTableView{
    _table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _table.dataSource = self;
    _table.delegate = self;
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



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = @[@"个人资料",@"主题颜色",@"头像装饰",@"帮助中心",@"关于微爱",@"退出微爱"];
    
    NSArray *imageNames = @[@"setting-1@2x",@"setting-2@2x",@"setting-4@2x",@"setting-6@2x",@"setting-8@2x",@"setting-11@2x"];
    
    static NSString *indentifil = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifil];
    }
    cell.imageView.image = [UIImage imageNamed:imageNames[indexPath.section]];
    cell.textLabel.text = array[indexPath.section];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.selectionStyle = NO;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 ) {
        personalViewController *personal = [[personalViewController alloc]init];
        [self.navigationController pushViewController:personal animated:YES];
    }else if(indexPath.section == 1){
        ThemeColourViewController *themeColour = [[ThemeColourViewController alloc]init];
        [self.navigationController pushViewController:themeColour animated:YES];
    }else if(indexPath.section == 2){
        HeadViewController *head = [[HeadViewController alloc]init];
        [self.navigationController pushViewController:head animated:YES];
    }else if(indexPath.section == 3){
        HelpCentreViewController *help = [[HelpCentreViewController alloc]init];
        [self.navigationController pushViewController:help animated:YES];
    }else if(indexPath.section == 4 ){
        AboutUsViewController *about = [[AboutUsViewController alloc]init];
        [self.navigationController pushViewController:about animated:YES];
    }else if(indexPath.section == 5 ){
        UIAlertView *alertVIew = [[UIAlertView alloc]initWithTitle:@"提示" message:@"退出后，您将与服务器断开连接，无法接收到对方的消息" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertVIew show];
      
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 10;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
