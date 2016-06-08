//
//  HeadViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "HeadViewController.h"

@interface HeadViewController (){
    UIImageView *selecdView;
}

@end

@implementation HeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
    [self creatButtons];
}
- (void)creatView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 80)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 40, 40)];
    imageView.layer.cornerRadius = 20;
    imageView.clipsToBounds = YES;
    imageView.image = [UIImage imageNamed:@"head_default_female@2x"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(75, 20, 40, 40)];
    imageView2.layer.cornerRadius = 20;
    imageView2.clipsToBounds = YES;
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kImageName];
    imageView2.image = [UIImage imageWithData:data];
    [view addSubview:imageView];
    [view addSubview:imageView2];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(120, 0,KScreenWidth - 120 , 80)];
    label.text = @"给你俩的头像选个可爱的装饰吧";
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    [view addSubview:label];
}

- (void)creatButtons{
    NSArray *titles = @[@"高富帅与白富美",@"天使与恶魔",@"老公与老婆",@"兔子",@"梦回大清",@"三国杀"];
    NSArray *images1 = @[@"1-1boy@2x",@"2-1boy@2x",@"3-1boy@2x",@"4-1boy@2x",@"5-1boy@2x",@"6-1boy@2x"];
   NSArray *images2 = @[@"1-1girl@2x",@"2-1girl@2x",@"3-1girl@2x",@"4-1girl@2x",@"5-1girl@2x",@"6-1girl@2x"];
    CGFloat width = (KScreenWidth - 300) / 3;
    for (int i = 0; i < 3; i++) {
        for (int p = 0; p < 2; p++) {
          UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(width + p * (150 + width), i * 120 + 100, 150, 100)];
            button.backgroundColor = [UIColor whiteColor];
            [self.view addSubview:button];
            UIView *View = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 140, 70)];
            View.backgroundColor = [UIColor grayColor];
            [button addSubview:View];
            UILabel *label  = [[UILabel alloc]initWithFrame:CGRectMake(5, 70, 150, 30)];
            label.text = titles[p+i*2];
            label.font = [UIFont systemFontOfSize:12];
            label.textColor = [UIColor blackColor];
            [View addSubview:label];
            UIImageView *imageview1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, 60, 60)];
            imageview1.image = [UIImage imageNamed:images1[p+i*2]];
            UIImageView *imageview2 = [[UIImageView alloc]initWithFrame:CGRectMake(70, 20, 60, 60)];
            imageview2.image = [UIImage imageNamed:images2[p+i*2]];
            [View addSubview:imageview1];
            [View addSubview:imageview2];
            button.tag = p+i*2;
            [button addTarget:selecdView action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    selecdView = [[UIImageView alloc]initWithFrame:CGRectMake(150, 155, 20, 20)];
    selecdView.image = [UIImage imageNamed:@"background_skin_select@2x"];
    [self.view addSubview:selecdView];
}


- (void)buttonAction:(UIButton *)button{
    button.selected =! button.selected;
    CGRect frame = selecdView.frame;
    NSInteger index = button.tag;
    if (index % 2 ==0) {
        frame = CGRectMake(150, 155 + index / 2 * 120, 20, 20);
        
    }else if(index % 2 == 1){
        frame = CGRectMake(325, 155 + (index -1)/ 2 * 120, 20, 20);
        
    }
    selecdView.frame = frame;
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
