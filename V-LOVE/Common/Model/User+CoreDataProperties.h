//
//  User+CoreDataProperties.h
//  V-LOVE
//
//  Created by mac on 15/11/8.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *content;

@end

NS_ASSUME_NONNULL_END
