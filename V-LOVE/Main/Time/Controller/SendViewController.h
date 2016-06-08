//
//  SendViewController.h
//  V-LOVE
//
//  Created by mac on 15/10/23.
//  Copyright (c) 2015年 XXX. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ZoomImageView.h"
typedef void(^InfoBlock)(NSString *,NSData *);

@interface SendViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>


@property (strong, nonatomic) UIImageView *sendImageView;
@property (strong, nonatomic) UIButton *tipButton;


@property(nonatomic,copy)InfoBlock myblock;

@end
