//
//  CoreDataManager.m
//  02-CoreDataManager
//
//  Created by kangkathy on 15/9/28.
//  Copyright (c) 2015年 kangkathy. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager


+ (instancetype)defaultManager {
    
    static CoreDataManager *instance = nil;
    
    static dispatch_once_t tocken;
    
    dispatch_once(&tocken, ^{
        
        instance = [[[self class] alloc] init];
        
        [instance configureCoreData];
        
        
    });
    
    
    return  instance;
    
}


- (void)configureCoreData {
    
    //1.创建数据模型文件及其包含的entity
    
    //2.根据数据模型文件进行加载，加载出NSManagedObjectModel对象，其代表数据模型文件。
    //数据模型文件被打包到程序包后其扩展名发生了改变：由CoreData.xcdatamodeld-->CoreData.momod
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"DataModel" withExtension:@"momd"];
    NSManagedObjectModel *dataModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:url];
    
    //3.创建PSC对象
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:dataModel];
    
    //4.将psc对象和外部的一个物理文件相对应
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/CoreData.rdb"];
    NSLog(@"%@", filePath);
    
    //存储类型代表使用哪一种类型的文件来做数据持久化，在iOS开发中不能使用XML格式来做数据持久化
    NSError *error = nil;
    [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:filePath] options:nil error:&error];
    
    if (error) {
        NSLog(@"数据持久化文件打开有错:%@",error);
    } else {
        NSLog(@"数据持久化文件打开成功");
    }
    
    //5.创建Contex对象，所有对于MO的处理，都是在context中完成。需要把context和PSC建立关联，才能实现数据持久化
    _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    _context.persistentStoreCoordinator = psc;
    
}


- (NSManagedObject *)createMO:(NSString *)entityName {
    
    if (entityName.length == 0) {
        return nil;
    }
    
    NSManagedObject *mo = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self.context];
    
    return mo;
}

- (BOOL)addManagedObject:(NSManagedObject *)mo {
    
    [self.context insertObject:mo];
    
    NSError *error = nil;
    if (![self.context save:&error]) {
        
        NSLog(@"同步失败:%@", error);
        
        return NO;
    }
 
    
    return YES;

}

- (NSArray *)query:(NSString *)entityName predicate:(NSPredicate *)predicate {
    
    if (entityName.length == 0) {
        return nil;
    }
    
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    
    request.predicate = predicate;
    
    NSArray *array = [self.context executeFetchRequest:request error:nil];
    
    return array;
    
    
}




@end
