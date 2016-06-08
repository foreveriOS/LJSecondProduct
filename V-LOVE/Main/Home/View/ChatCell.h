//
//  ChatCell.h
//  V-LOVE
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChatModel;
@interface ChatCell : UITableViewCell
@property(nonatomic,strong)ChatModel *model;

@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet UIImageView *chatFrame;
@property (strong, nonatomic) IBOutlet UILabel *chatLabel;

@property (weak, nonatomic) IBOutlet UIImageView *yourPhoto;
@property (weak, nonatomic) IBOutlet UILabel *yourChatLabel;
@property (weak, nonatomic) IBOutlet UIImageView *yourChatFrame;

@end
