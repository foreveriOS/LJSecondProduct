//
//  TimeModel.h
//  V-LOVE
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 XXX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeModel : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSData *imageData;
@property (nonatomic, copy) NSString *month;
@property (nonatomic, copy) NSString *day;
@property (nonatomic, copy) NSString *time;

@end
