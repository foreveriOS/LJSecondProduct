//
//  HomeViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/14.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "HomeViewController.h"
#import "setViewController.h"
#import "CommemorationViewController.h"
#import "WishViewController.h"
#import "ChatViewController.h"
#import "ThemeLabel.h"
@interface HomeViewController (){
    UIImageView *_bgimageView;

}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatRightButton];
    [self creatbgView];
    [self creatbgButton];
    [self creatCommemorationButton];
    [self creatChatButton];
    [self creatWishButton];
    self.title = @"首页";
}

// 创建背景视图
- (void)creatbgView{
    _bgimageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,KScreenWidth,KScreenHeight - 64 - 49)];
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kbgImageName];
    _bgimageView.image = [UIImage imageWithData:data];
    if (_bgimageView.image == nil) {
    _bgimageView.image = [UIImage imageNamed:@"cover-3@2x"];
        _bgimageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgimageView.clipsToBounds = YES;
    }
    [self.view addSubview:_bgimageView];
}
// 创建右侧设置按钮
- (void)creatRightButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setImage:[UIImage imageNamed:@"ln_common_settings@2x"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightButton;
}
// 创建改变背景图片按钮
- (void)creatbgButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(KScreenWidth - 47,20, 27, 27);
    [button setImage:[UIImage imageNamed:@"cover-1@2x"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(bgButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
// 创建纪念日按钮
- (void)creatCommemorationButton{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(13, 35, 40, 20)];
    label.font = [UIFont systemFontOfSize:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"纪念日";
    label.textColor = [UIColor grayColor];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(13, 15, 40, 20)];
    label2.font = [UIFont systemFontOfSize:25];
    label2.textAlignment = NSTextAlignmentCenter;
//    NSString *path = [NSString stringWithFormat:@"%@",NSHomeDirectory()];
    label2.text = @"0";
    label2.textColor = [UIColor redColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30, KScreenHeight - 200  , 62, 62);
    [button setBackgroundImage:[UIImage imageNamed:@"common_round_btn_bg@2x"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(commemorationButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button addSubview:label];
    [button addSubview:label2];
    [self.view addSubview:button];
    
}
// 创建聊天按钮
- (void)creatChatButton{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(13, 35, 40, 20)];
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"聊天";
    label.textColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((KScreenWidth - 71) / 2, KScreenHeight - 209 , 71, 71)];
    imageView.image = [UIImage imageNamed:@"cover_center_bg@2x"];
    [self.view addSubview:imageView];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(4.5,4, 62, 62);
    [button setImage:[UIImage imageNamed:@"cover-5_5@2x"] forState: UIControlStateNormal];
    [button addTarget:self action:@selector(chatButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button addSubview:label];
    imageView.userInteractionEnabled = YES;
    [imageView addSubview:button];
    
    
}
//创建愿望按钮
- (void)creatWishButton{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(12, 35, 40, 20)];
    label.font = [UIFont systemFontOfSize:10];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"情侣愿望";
    label.textColor = [UIColor grayColor];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(13, 15, 40, 20)];
    label2.font = [UIFont systemFontOfSize:25];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = @"0";
    label2.textColor = [UIColor redColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(KScreenWidth - 62 - 30, KScreenHeight - 200 , 62, 62);
    [button setBackgroundImage:[UIImage imageNamed:@"common_round_btn_bg@2x"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(wishButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button addSubview:label];
    [button addSubview:label2];
    [self.view addSubview:button];
}
// 右侧按钮添加方法
- (void)rightButtonAction:(UIButton *)button{
    setViewController *set = [[setViewController alloc]init];
    [self.navigationController pushViewController:set animated:YES];
    
    
}
// 改变背景图片按钮添加方法
- (void)bgButtonAction:(UIButton *)button{

    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"相册",@"恢复默认", nil];
    
    [sheet showInView:self.view];
    

    
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    UIImagePickerControllerSourceType sourceType;
    if (buttonIndex == 0) {
        sourceType = UIImagePickerControllerSourceTypeCamera;
        BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
        if (!isCamera) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"摄像头无法使用" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alertView show];
            return;
        }
    }else if(buttonIndex == 1){
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }else if(buttonIndex == 2){
        UIImage *image = [UIImage imageNamed:@"cover-3"];
        _bgimageView.image = image;
        NSData *data = UIImageJPEGRepresentation(image, 1);
        [self UseNSUserDefaults:data forKey:kbgImageName];
    }
    else{
        return;
    }
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    if (buttonIndex == 0 || buttonIndex == 1) {
        picker.sourceType = sourceType;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];

    }

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //获取选择的图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    _bgimageView.image = image;
    NSData *data = UIImageJPEGRepresentation(image, 1);
    [self UseNSUserDefaults:data forKey:kbgImageName];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
} 
//聊天按钮方法
- (void)chatButtonAction:(UIButton *)button{
    ChatViewController *chat = [[ChatViewController alloc]init];
    [self.navigationController pushViewController:chat animated:YES];
    
}
//纪念日按钮方法
- (void)commemorationButtonAction:(UIButton *)button{
    CommemorationViewController *commenmoration = [[CommemorationViewController alloc]init];
    [self.navigationController pushViewController:commenmoration animated:YES];
}
// 愿望按钮方法
- (void)wishButtonAction:(UIButton *)button{
    WishViewController *wish = [[WishViewController alloc]init];
    [self.navigationController pushViewController:wish animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
