//
//  LifeTopicDetailsViewController.m
//  V-LOVE
//
//  Created by Tony on 15/10/28.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import "LifeTopicDetailsViewController.h"
#import "LifeTopicDetailsTableView.h"
#import "DataService.h"
#import "LifeDetailModel.h"

@interface LifeTopicDetailsViewController (){
    NSMutableArray *_data;
    LifeTopicDetailsTableView *_tableView1;
    LifeTopicDetailsTableView *_tableView2;
    LifeTopicDetailsTableView *_tableView3;
}

@end

@implementation LifeTopicDetailsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self _createSegmentedControl];
    [self _createSubViews];
    
    [self _loadData1];
}

#pragma mark - 创建子视图
- (void)_createSubViews{
    //创建分页 表视图
    _tableView1 = [[LifeTopicDetailsTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView1];
    _tableView1.lifeModel = _model;
    _tableView1.hidden = NO;
    
    _tableView2 = [[LifeTopicDetailsTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView2];
    _tableView2.lifeModel = _model;
    _tableView2.hidden = YES;
    
    _tableView3 = [[LifeTopicDetailsTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView3];
    _tableView3.lifeModel = _model;
    _tableView3.hidden = YES;
    
    //初始化
    _data = [[NSMutableArray alloc] init];
    
}

#pragma mark - 创建segmentedController
- (void)_createSegmentedControl{
    NSArray * items = [NSArray arrayWithObjects:@"全部",@"新鲜",@"精华", nil];
    UISegmentedControl * mySegmentedControl = [[UISegmentedControl alloc]initWithItems:items];
    mySegmentedControl.frame = CGRectMake(0 , 0, KScreenWidth - 150, 25);
    mySegmentedControl.tintColor = [UIColor whiteColor];
    mySegmentedControl.selectedSegmentIndex = 0;
    self.navigationItem.titleView = mySegmentedControl;
    //添加 点击事件
    [mySegmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - 设置分页
- (void)segmentAction:(id)sender
{
    if ([sender isKindOfClass:[UISegmentedControl class]])
    {
        switch ([sender selectedSegmentIndex]) {
            case 0:
                _tableView1.hidden = NO;
                _tableView2.hidden = YES;
                _tableView3.hidden = YES;
                _data = [[NSMutableArray alloc] init];
                [self _loadData1];
                break;
                
            case 1:
                _tableView1.hidden = YES;
                _tableView2.hidden = NO;
                _tableView3.hidden = YES;
                _data = [[NSMutableArray alloc] init];
                [self _loadData2];
                break;
                
            case 2:
                _tableView1.hidden = YES;
                _tableView2.hidden = YES;
                _tableView3.hidden = NO;
                _data = [[NSMutableArray alloc] init];
                [self _loadData3];
                break;
                
            default:
                break;
        }
    }
}

#pragma mark - 加载 3个 分页的数据
- (void)_loadData1
{
    [self _loadDataWithPlistName:@"LifeSig" tableView:_tableView1 type:@"0"];
}

- (void)_loadData2
{
    [self _loadDataWithPlistName:@"LifeFreshSig" tableView:_tableView2 type:@"1"];
}

- (void)_loadData3
{
    [self _loadDataWithPlistName:@"LifeEssenceSig" tableView:_tableView3 type:@"2"];
}

#pragma mark - 封装 加载数据的方法
- (void)_loadDataWithPlistName:(NSString *)plistName tableView:(LifeTopicDetailsTableView *)tableView type:(NSString *)type
{
    //获取 请求体 相关数据
    NSString *category = [NSString stringWithFormat:@"%@",_model.category];
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *sig = dic[category];
    NSString *urlStr = @"http://api.welove520.com/v4/life/group/feed/list";
    NSDictionary *params = @{
                             @"top_feed":@"1",
                             @"access_token":@"562949970844965-190334389f88849ab",
                             @"count":@"10",
                             @"type":type,
                             @"category":category,
                             @"start":@"0",
                             @"sig":sig
                             };
    [DataService requestData:urlStr HTTPMethod:@"POST" params:[params mutableCopy] completionHandle:^(id result) {
        NSArray *feeds = result[@"feeds"];
        for (NSDictionary *dic in feeds)
        {
            LifeDetailModel *model = [[LifeDetailModel alloc] initWithDataDic:dic];
 
            [_data addObject:model];
        }
        //回到主线程  更新UI
        dispatch_sync(dispatch_get_main_queue(), ^{
            tableView.data = _data;
            [tableView reloadData];
        });
    }errorHandle:^(NSError *error) {
        NSLog(@"请求失败");
    }];
}

@end
