//
//  Spirit+CoreDataProperties.h
//  V-LOVE
//
//  Created by mac on 15/11/8.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Spirit.h"

NS_ASSUME_NONNULL_BEGIN

@interface Spirit (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *photo;
@property (nullable, nonatomic, retain) NSString *text;
@property (nullable, nonatomic, retain) NSString *month;
@property (nullable, nonatomic, retain) NSString *day;
@property (nullable, nonatomic, retain) NSString *time;


@end

NS_ASSUME_NONNULL_END
