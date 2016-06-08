//
//  ChatViewController.h
//  V-LOVE
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "BaseViewController.h"
#import <AVOSCloudIM.h>
#import <AVOSCloud.h>

@interface ChatViewController : BaseViewController<UITextViewDelegate,UITableViewDelegate,UITableViewDataSource,AVIMClientDelegate>
@property (nonatomic, strong) AVIMClient *client;

@end
