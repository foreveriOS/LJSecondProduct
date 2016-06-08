//
//  ChatModel.h
//  V-LOVE
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatModel : NSObject
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSData *icon;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,assign)BOOL isSelf;
@end
