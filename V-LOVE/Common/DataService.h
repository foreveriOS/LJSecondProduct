//
//  DataService.h
//  V-LOVE
//
//  Created by mac on 15/10/27.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataService : NSObject

//使用NSURLConnection组件来做网络申请
+ (void)requestData:(NSString *)urlString
         HTTPMethod:(NSString *)method
             params:(NSMutableDictionary *)params
   completionHandle:(void(^)(id result))completionblock
        errorHandle:(void(^)(NSError *error))errorblock;

@end
