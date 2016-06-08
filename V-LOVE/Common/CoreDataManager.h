//
//  CoreDataManager.h
//  02-CoreDataManager
//
//  Created by kangkathy on 15/9/28.
//  Copyright (c) 2015年 kangkathy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

@property(nonatomic, strong)NSManagedObjectContext *context;



+ (instancetype)defaultManager;

//配置CoreData信息
- (void)configureCoreData;


- (NSManagedObject *)createMO:(NSString *)entityName;


//添加MO对象
- (BOOL)addManagedObject:(NSManagedObject *)mo;


//查询
- (NSArray *)query:(NSString *)entityName predicate:(NSPredicate *)predicate;

//删除


//更新




@end
