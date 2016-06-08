//
//  LifeArderViewController.m
//  V-LOVE
//
//  Created by Tony on 15/10/28.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import "LifeArderViewController.h"
#import "LifeArderTableView.h"
#import "DataService.h"
#import "LifePlayModel.h"

@interface LifeArderViewController ()
{
    LifeArderTableView *_tableView1;
    LifeArderTableView *_tableView2;
    LifeArderTableView *_tableView3;
    NSMutableArray *_data;
}

@end

@implementation LifeArderViewController

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

- (void)_createSubViews{
    //创建3个 tableView
    //01 精选
    _tableView1 = [[LifeArderTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    [_tableView1 setSeparatorColor:[UIColor clearColor]];
    _tableView1.backgroundView = nil;
    //顶部视图 数据传递
    _tableView1.lifeModel = self.model;
    [self.view addSubview:_tableView1];
    _tableView1.hidden = NO;
    
    //02 热门
    _tableView2 = [[LifeArderTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    [_tableView2 setSeparatorColor:[UIColor clearColor]];
    _tableView2.backgroundView = nil;
    //顶部视图 数据传递
    _tableView2.lifeModel = self.model;
    [self.view addSubview:_tableView2];
    _tableView2.hidden = YES;
    
    //03 最新
    _tableView3 = [[LifeArderTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    [_tableView3 setSeparatorColor:[UIColor clearColor]];
    _tableView3.backgroundView = nil;
    //顶部视图 数据传递
    _tableView3.lifeModel = self.model;
    [self.view addSubview:_tableView3];
    _tableView3.hidden = YES;
    
    _data = [[NSMutableArray alloc] init];
}

- (void)_createSegmentedControl{
    NSArray * items = [NSArray arrayWithObjects:@"精选",@"热门",@"最新", nil];
    UISegmentedControl * mySegmentedControl = [[UISegmentedControl alloc]initWithItems:items];
    mySegmentedControl.frame = CGRectMake(0 , 0, KScreenWidth - 150, 25);
    mySegmentedControl.tintColor = [UIColor whiteColor];
    mySegmentedControl.selectedSegmentIndex = 0;
    self.navigationItem.titleView = mySegmentedControl;
    
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
                _data = [NSMutableArray array];
                [self _loadData1];

                
                break;
                
            case 1:
                _tableView1.hidden = YES;
                _tableView2.hidden = NO;
                _tableView3.hidden = YES;
                _data = [NSMutableArray array];
                [self _loadData2];

                
                break;
                
            case 2:
                _tableView1.hidden = YES;
                _tableView2.hidden = YES;
                _tableView3.hidden = NO;
                _data = [NSMutableArray array];
                [self _loadData3];
                
                break;
                
            default:
                break;
        }
    }
}

#pragma mark - 封装 加载数据的方法
- (void)_loadDataWithPlistName:(NSString *)plistName tableView:(LifeArderTableView *)tableView type:(NSString *)type
{
    //获取 请求体 相关数据
    NSString *category = [NSString stringWithFormat:@"%@",_model.category];
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *sig = dic[category];
    NSString *urlStr = @"http://api.welove520.com/v4/life/feed/list";
    NSDictionary *params = @{
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
            LifePlayModel *model = [[LifePlayModel alloc] initWithDataDic:dic];
            
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


#pragma mark - 加载数据
- (void)_loadData1
{

    [self _loadDataWithPlistName:@"LifePlaySig" tableView:_tableView1 type:@"1"];
}

- (void)_loadData2
{
    [self _loadDataWithPlistName:@"LifePlayHotSig" tableView:_tableView2 type:@"2"];

}

- (void)_loadData3
{
    [self _loadDataWithPlistName:@"LifePlayNewSig" tableView:_tableView3 type:@"3"];
}

@end
