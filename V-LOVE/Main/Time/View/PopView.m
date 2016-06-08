//
//  PopView.m
//  V-LOVE
//
//  Created by mac on 15/10/21.
//  Copyright (c) 2015年 XXX. All rights reserved.
//

#define buttonImageNames @[@"timeline_share_photo",@"timeline_share_text",@"timeline_share_share"]
#define labelNames @[@"照片",@"文字",@"分享"]

#import "PopView.h"
#import "UIView+UIViewController.h"
#import "SendViewController.h"
#import "BaseNavigationController.h"

@implementation PopView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithRed:0.2 green:0.25 blue:0.25 alpha:0.1];
        [self _createSubViews];
    }
    return self;
}

- (void)_createSubViews
{

    
    CABasicAnimation *basic1 = [self scaleViewFromValue:@0.7 toValue:@1.15 duration:0.2];
    CABasicAnimation *basic2 = [self scaleViewFromValue:@0.8 toValue:@1.3 duration:0.16];
    CABasicAnimation *basic3 = [self scaleViewFromValue:@0.75 toValue:@1.2 duration:0.22];
    NSArray *basics = [NSArray arrayWithObjects:basic1,basic2,basic3, nil];
    
    for (int i = 0; i < 3; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(KScreenWidth / 3 * i + KScreenWidth / 6 - 25, (KScreenHeight - 50) / 2, 50, 50);
        button.layer.cornerRadius = 20;
        button.layer.shadowColor = [UIColor blackColor].CGColor;
        button.layer.shadowOffset = CGSizeMake(0, 3);
        button.backgroundColor = [UIColor whiteColor];
        button.tag = i;
        
        [self addSubview:button];
        [button setImage:[UIImage imageNamed:buttonImageNames[i]] forState:UIControlStateNormal];
        [button.layer addAnimation:basics[i] forKey:nil];
        //按钮动作
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
       
        
        [self performSelector:@selector(_createLabel) withObject:nil afterDelay:0.4];
    }
    
}
#pragma mark - 创建文本
- (void)_createLabel
{
    for (int i = 0; i < 3; i++)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth / 3 * i + KScreenWidth / 6 - 25, (KScreenHeight - 50) / 2 + 60, 50, 20)];
        label.text = labelNames[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont boldSystemFontOfSize:15];
        [self addSubview:label];
        
    }
}

#pragma mark - 缩放实现
- (CABasicAnimation *)scaleViewFromValue:(NSNumber *)fromValue toValue:(NSNumber *)toValue duration:(CFTimeInterval)duration
{
    //创建基础动画 实现缩放
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //缩放比例从 0.2 - 2倍
    basic.fromValue = fromValue;
//    basic.byValue = @1.5;
    basic.toValue = toValue;
    
    basic.duration = duration;
    basic.autoreverses = YES;
    basic.speed = 1.8;
    basic.repeatCount = 1.5;

    
    return basic;
}

#pragma mark - 按钮点击动作
- (void)buttonAction:(UIButton *)btn
{
    if (btn.tag == 0)
    {
        //照片
        UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"拍摄照片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //打开相机
            [self _openCamera];
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"从相册中选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //相册中选取
            [self _selectPhoto];
        }];
        UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertCtrl addAction:action1];
        [alertCtrl addAction:action2];
        [alertCtrl addAction:action3];
        [self.viewController presentViewController:alertCtrl animated:YES completion:nil];
    }
    else if (btn.tag == 1)
    {
        //文字
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Time" bundle:nil];
        SendViewController *sendCtrl = (SendViewController *)[story instantiateViewControllerWithIdentifier:@"SendViewController"];
        
        sendCtrl.hidesBottomBarWhenPushed = YES;

        [sendCtrl setMyblock:^(NSString *str,NSData *data){
            _myblock(str,data);
        }];
    
        
        [self.viewController.navigationController pushViewController:sendCtrl animated:NO];
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:SAVEIMAGES];
        
    }
    else
    {
        //分享
    }


}



#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        //拍摄照片
        [self _openCamera];
    }
    else if (buttonIndex == 1)
    {
        //相册中选取
        [self _selectPhoto];
    }
}
#pragma mark - 打开相机
- (void)_openCamera
{
    //设置来源 为相机
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    if (!isCamera)
    {
        UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"提示" message:@"摄像头无法使用" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alertCtrl addAction:action];
        
        [self.viewController presentViewController:alertCtrl animated:YES completion:nil];
        
        return;
    }
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    
    [self.viewController  presentViewController:picker animated:YES completion:nil];
}

#pragma mark - 选择照片
- (void)_selectPhoto
{
    //设置来源 为相册
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    
    [self.viewController  presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //弹出 相册
    [picker dismissViewControllerAnimated:NO completion:nil];
    
    //取照片
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //如果 图片存在 则发送
    if (image != nil)
    {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Time" bundle:nil];
        SendViewController *sendCtrl = (SendViewController *)[story instantiateViewControllerWithIdentifier:@"SendViewController"];
        sendCtrl.hidesBottomBarWhenPushed = YES;

        [self.viewController.navigationController pushViewController:sendCtrl animated:YES];

        //block实现
        sendCtrl.myblock = ^(NSString *str,NSData *data)
        {
            _myblock(str,data);
        };
        
        NSData *data = UIImageJPEGRepresentation(image, 1);
        
        //数据持久化
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:SAVEIMAGES];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
 
}
@end
