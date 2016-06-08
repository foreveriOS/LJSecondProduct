//
//  TimeLineTableView.m
//  V-LOVE
//
//  Created by mac on 15/10/25.
//  Copyright (c) 2015年 XXX. All rights reserved.
//

#import "TimeLineTableView.h"
#import "TimeLineCell.h"
#import "UIViewExt.h"
#import "ZoomImageView.h"
#import "TimeLineWithImageCell.h"
#import "TimeLineWithImageTextCell.h"
#import "CoreDataManager.h"
#import "Spirit.h"
@implementation TimeLineTableView
{
    UIScrollView *_scrollView;
    UIImageView *_firstImgView;       //动画图片1
    UIImageView *_secondImgView;      //动画图片2
    UIImageView *_thirdImgView;       //动画图片3
    UIImageView *_imageView;
    CGSize labelSize;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self)
    {
        //设置 代理 数据源
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
        self.showsVerticalScrollIndicator = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;

        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((KScreenWidth - 143)/2, kScreenHeight - 350, 143, 122)];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;

        _imageView.image = [UIImage imageNamed:@"no_feed_content.png"];
        [self addSubview:_imageView];

        //注册 单元格
        UINib *nib = [UINib nibWithNibName:@"TimeLineCell" bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:@"TimeLineCell"];
        
        UINib *nib2 = [UINib nibWithNibName:@"TimeLineWithImageCell" bundle:nil];
        [self registerNib:nib2 forCellReuseIdentifier:@"TimeLineWithImageCell"];
        
        UINib *nib3 = [UINib nibWithNibName:@"TimeLineWithImageTextCell" bundle:nil];
        [self registerNib:nib3 forCellReuseIdentifier:@"TimeLineWithImageTextCell"];
        
        _data = [[NSMutableArray alloc] init];
        [self readCoreData];
        
    }
    return self;
}


#pragma mark - 利用 滑动视图 实现 动画视图
- (void)_createAnimationView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 200)];
    _scrollView.contentSize = CGSizeMake(KScreenWidth, 400);
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.userInteractionEnabled = NO;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    
    _firstImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 400)];
    _firstImgView.image = [UIImage imageNamed:@"tl_cover_def_1"];
    [_scrollView addSubview:_firstImgView];
    
    _secondImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -100, KScreenWidth, 400)];
    _secondImgView.image = [UIImage imageNamed:@"tl_cover_def_2"];
    [_scrollView addSubview:_secondImgView];
    
    _thirdImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 400)];
    _thirdImgView.image = [UIImage imageNamed:@"tl_cover_def_3"];
    [_scrollView addSubview:_thirdImgView];
    
    self.tableHeaderView = _scrollView;
    
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _data.count;
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_data.count != 0 && _scrollView == nil)
    {
        [self _createAnimationView];
        _imageView.hidden = YES;
        _imageView = nil;
    }

    TimeModel *model = _data[indexPath.row];

    //只带图片
    if (model.imageData != nil && model.text.length == 0)
    {
        TimeLineWithImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimeLineWithImageCell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }
    
    //同时带图片和文字
    if (model.imageData != nil && model.text.length != 0)
    {
        TimeLineWithImageTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimeLineWithImageTextCell" forIndexPath:indexPath];
        cell.model = model;
        return cell;
    }
    
    //只有 文字
    TimeLineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimeLineCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.model = _data[indexPath.row];
    
    NSString *text = model.text;
    
    //高度自适应
    labelSize = [text boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size;

    cell.titleLabel.height = labelSize.height;
    cell.titleLabel.text = text;
    
    
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TimeModel *model = _data[indexPath.row];
    if (model.imageData != nil && model.text == nil)
    {
        return 195;
    }
    if (model.imageData != nil && model.text != nil)
    {
        return 210;
    }
    return labelSize.height + 100;
}
// 读取数据
- (void)readCoreData{
    CoreDataManager *manager = [CoreDataManager defaultManager];
    NSArray *array = [manager query:@"Spirit" predicate:nil];
    for (Spirit *spirit in array) {
        TimeModel *model = [[TimeModel alloc]init];
        model.text = spirit.text;
        model.imageData = spirit.photo;
        model.month = spirit.month;
        model.day = spirit.day;
        model.time = spirit.time;
        [_data insertObject:model atIndex:0];
        
    }
}





@end
