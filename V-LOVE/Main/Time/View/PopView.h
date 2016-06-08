//
//  PopView.h
//  V-LOVE
//
//  Created by mac on 15/10/21.
//  Copyright (c) 2015年 XXX. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^InfoBlock)(NSString *,NSData *);


@interface PopView : UIView<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(nonatomic,copy)InfoBlock myblock;


@property(nonatomic,strong)UIImage *selectedImage;

@end
