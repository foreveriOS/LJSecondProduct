//
//  AdviceViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/22.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "AdviceViewController.h"

@interface AdviceViewController (){
    UILabel *label2;

}

@end

@implementation AdviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _creatSubView];
    // Do any additional setup after loading the view.
}

- (void)_creatSubView{
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 30)];
    label1.text = @"更多问题可以直接提问我们";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor grayColor];
    [self.view addSubview:label1];
    label2 = [[UILabel alloc]initWithFrame:CGRectMake(3, 3, KScreenWidth, 20)];
    label2.enabled = NO;
    label2.text = @"请尽量详细描述问题,V-LOVE会第一时间为您解决";
    label2.font =  [UIFont systemFontOfSize:13];
    label2.textColor = [UIColor lightGrayColor];
    UITextView *field = [[UITextView alloc]initWithFrame:CGRectMake(0, 30, KScreenWidth, 200)];
    field.backgroundColor = [UIColor whiteColor];
    field.delegate = self;
    [field addSubview:label2];
    [self.view addSubview:field];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 250, KScreenWidth - 20, 50)];
    [button setTitle:@"提交" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:button];
}

- (void) textViewDidChange:(UITextView *)textView{
    if ( textView.text.length == 0) {
        label2.hidden = NO;
    }else{
        label2.hidden = YES;
    }
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
