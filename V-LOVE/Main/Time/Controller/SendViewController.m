//
//  SendViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/23.
//  Copyright (c) 2015年 XXX. All rights reserved.
//

#define imageWidth KScreenWidth/4 - 12.5

#import "SendViewController.h"
#import "UIPlaceHolderTextView.h"
#import "PopView.h"
#import "CoreDataManager.h"
#import "Spirit.h"
#import "PopView.h"
@interface SendViewController ()<UITextViewDelegate>
{
    
    IBOutlet UIPlaceHolderTextView *_textView;

    UIImageView *_imageView;
}
@end

@implementation SendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textView.placeholder = @"现在是什么心情？想记录些什么？";

    [self _createNavigationBar];
    
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:SAVEIMAGES];
    if (data != nil)
    {
        [self _createSubViews];
    }
   

}

- (void)reloadImageView
{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:SAVEIMAGES];
    UIImage *image = [UIImage imageWithData:data];
    _sendImageView.image = image;
}
- (void)viewWillAppear:(BOOL)animated
{
    [self reloadImageView];
}


#pragma mark - 创建 子视图
- (void)_createSubViews
{
    _sendImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, _textView.bottom + 10, imageWidth, imageWidth)];
    _sendImageView.userInteractionEnabled = YES;
    _sendImageView.contentMode = UIViewContentModeScaleAspectFill;
    _sendImageView.clipsToBounds = YES;
    [self.view addSubview:_sendImageView];
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [_sendImageView addGestureRecognizer:tap];
}

#pragma mark - 点击图片动作
- (void)tapAction
{
    UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:@"发送照片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"清除图片" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {

        [[NSUserDefaults standardUserDefaults] removeObjectForKey:SAVEIMAGES];
        [self reloadImageView];
        
    }];
    UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertCtrl addAction:action3];
    [alertCtrl addAction:action4];
    
    
    [self presentViewController:alertCtrl animated:YES completion:nil];
}



#pragma mark - 导航栏
- (void)_createNavigationBar
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 40, 40);
    [button setTitle:@"完成" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark - 确定动作
- (void)buttonAction
{

    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:SAVEIMAGES];
    _myblock(_textView.text,data);
    [self SaveCoreData];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
// CoreData数据持久化 保存数据
- (void)SaveCoreData{
    CoreDataManager *manager = [CoreDataManager defaultManager];
    Spirit *spirit = (Spirit *)[manager createMO:@"Spirit"];
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:SAVEIMAGES];
    
    //获取时间
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    ;
    //01 月、日
    NSString *month = [NSString stringWithFormat:@"%li",dateComponent.month];
    NSString *day = [NSString stringWithFormat:@"%li",dateComponent.day];
    //02 几点几分
    NSUInteger hour = dateComponent.hour;
    NSUInteger minute = dateComponent.minute;
    NSString *time = [NSString stringWithFormat:@"%li:%li",hour,minute];
    
    spirit.photo = data;
    spirit.text = _textView.text;
    spirit.month = month;
    spirit.day = day;
    spirit.time = time;
    
    [manager addManagedObject:spirit];
}

@end
