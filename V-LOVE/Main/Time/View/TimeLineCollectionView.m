//
//  TimeLineCollectionView.m
//  V-LOVE
//
//  Created by mac on 15/10/31.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import "TimeLineCollectionView.h"
#import "CoreDataManager.h"
#import "Spirit.h"

@implementation TimeLineCollectionView
{
    UILabel *_label;
}



- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self)
    {
        self.delegate = self;
        self.dataSource = self;
        
        self.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
        
        
        
        //注册
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"ShowImageCell"];
        
        //初始化 可变数组
        if (_data == nil) {
            _data = [NSMutableArray array];
        }
        
        //从数据库加载图片
        [self readCoreData];
    }
    return self;
}

#pragma mark - 数据库加载图片
- (void)readCoreData{
    CoreDataManager *manager = [CoreDataManager defaultManager];
    NSArray *array = [manager query:@"Spirit" predicate:nil];
    for (Spirit *spirit in array) {

        if (spirit.photo) {
            [_data insertObject:spirit.photo atIndex:0];
        }
        
    }
}


#pragma mark - 创建 展示 数目 视图
- (void)_createShowNumberView
{
    //设置label
    _label = [[UILabel alloc] initWithFrame:CGRectMake(40, 10, kScreenWidth - 80, 30)];
    _label.layer.borderWidth = 0.5;
    _label.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _label.layer.cornerRadius = 13;
    _label.clipsToBounds = YES;
    _label.backgroundColor = [UIColor whiteColor];
    _label.textColor = [UIColor redColor];
    _label.font = [UIFont boldSystemFontOfSize:16];
    _label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_label];
    
    
    //图文混排设置
    NSString *string = [NSString stringWithFormat:@"共有 %li 个瞬间",_data.count];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:string];
    //设置属性
    [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:[string rangeOfString:@"共有"]];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:[string rangeOfString:@"个瞬间"]];
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:[string rangeOfString:@"共有"]];
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:[string rangeOfString:@"个瞬间"]];
    
    _label.attributedText = attributedStr;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _data.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ShowImageCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    
    if (_data.count != 0)
    {
        [self _createShowNumberView];
    }
    
    //取出 数据
    NSData *data = _data[indexPath.item];
    UIImage *image = [UIImage imageWithData:data];
    //属性赋值
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.bounds];
    imageView.image = image;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;

    [cell.contentView addSubview:imageView];
    return cell;
}


@end
