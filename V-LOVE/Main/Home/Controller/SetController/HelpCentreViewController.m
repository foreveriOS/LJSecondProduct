//
//  HelpCentreViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "HelpCentreViewController.h"
#import "ProblemViewController.h"
#import "FeedbackViewController.h"
#import "AdviceViewController.h"
@interface HelpCentreViewController ()
{
    UITableView *_table;

}
@end

@implementation HelpCentreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTableView];

}
- (void)creatTableView{
    _table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _table.dataSource = self;
    _table.delegate = self;
    _table.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_table];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
     return 3;
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = @[@"常见问题",@"问题反馈",@"产品建议"];
    static NSString *indentifil = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifil];
    }
    cell.selectionStyle = NO;
    cell.textLabel.text = array[indexPath.row];

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        ProblemViewController *problem = [[ProblemViewController alloc]init];
        [self.navigationController pushViewController:problem animated:YES];
    }else if(indexPath.row == 1){
        FeedbackViewController *feedBack = [[FeedbackViewController alloc]init];
        [self.navigationController pushViewController:feedBack animated:YES];
    }else{
        AdviceViewController *advice = [[AdviceViewController alloc]init];
        [self.navigationController pushViewController:advice animated:YES];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
