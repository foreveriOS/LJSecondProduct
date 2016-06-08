//
//  LifePlayModel.h
//  V-LOVE
//
//  Created by mac on 15/10/29.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//
/*

 
 {
 
 "be_liked" = 1;
 
 cover =             {
 
 height = 354;
 
 "large_url" = "http://welove.b0.upaiyun.com/img/20151028/1758/19b977b9.jpg_large";
 
 "main_url" = "http://welove.b0.upaiyun.com/img/20151028/1758/19b977b9.jpg_main";
 
 "photo_id" = 2814750055568602;
 
 "tiny_url" = "http://welove.b0.upaiyun.com/img/20151028/1758/19b977b9.jpg_tiny";
 
 width = 640;
 
 };
 
 "feed_id" = 9007199254752546;
 
 gender = 0;
 
 headurl = "http://welove.b0.upaiyun.com/img/20150421/1905/78bcff1a.jpg_tiny";
 
 "like_count" = 224;
 
 "love_space_id" = 844424935129004;
 
 reason = "\U597d\U5403\U53c8\U5065\U5eb7\U7684\U674f\U9c8d\U83c7\U3002";
 
 status = 0;
 
 time = 1446033600000;
 
 title = "\U5065\U5eb7\U83dc\Uff1a\U8017\U6cb9\U674f\U9c8d\U83c7";
 
 "user_id" = 562949968817984;
 
 "user_name" = "\U8349\U8393\U7231\U9178\U5976";
 
 },
 

 */


#import "BaseModel.h"

@interface LifePlayModel : BaseModel

@property (nonatomic, copy) NSString *title;       //标题
@property (nonatomic, copy) NSDictionary *cover;   //菜图 存放字典
@property (nonatomic, copy) NSString *headurl;     //用户头像
@property (nonatomic, copy) NSString *user_name;   //用户名字
@property (nonatomic, copy) NSString *reason;      //简评
@property (nonatomic, strong) NSNumber *like_count;//好评数

@end
