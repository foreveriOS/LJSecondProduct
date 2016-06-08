//
//  TimeLineCollectionView.h
//  V-LOVE
//
//  Created by mac on 15/10/31.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeLineCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *data;

@end
