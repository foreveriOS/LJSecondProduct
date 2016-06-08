//
//  LifeModel.h
//  V_LOVE
//
//  Created by Tony on 15/10/27.
//  Copyright © 2015年 zhengyiqun. All rights reserved.
//

#import "BaseModel.h"

@interface LifeModel : BaseModel

@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *image_url;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *heat;
@property (nonatomic, strong) NSNumber *category;

@end
