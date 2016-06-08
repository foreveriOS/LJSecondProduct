//
//  LifeDetailModel.h
//  V-LOVE
//
//  Created by mac on 15/10/28.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//
/*
 {
 authority = 0;
 category = 10000;
 "comment_count" = 352;
 essence = 0;
 "feed_id" = 301545;
 "feed_new" = 0;
 gender = 0;
 headurl = "http://welove.b0.upaiyun.com/img/20150522/1246/0d360693.jpg_tiny";
 hot = 1;
 identify = 0;
 recommend = 0;
 "reply_time" = 1446017140654;
 status = 0;
 time = 1445471425060;
 title = "\U6211\U4eec\U5728\U4e00\U8d77193\U5929\U4e86\U3002\U5374\U3002\U3002\U3002\U3002\U3002";
 "user_id" = 562949969506064;
 "user_name" = "\U5bb6\U6709\U8d24\U592b\U745e\U5b9d";
 },

 */
#import "BaseModel.h"

@interface LifeDetailModel : BaseModel
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, strong) NSNumber *comment_count;


@end
