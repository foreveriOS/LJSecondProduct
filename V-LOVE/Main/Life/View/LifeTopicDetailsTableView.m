//
//  LifeTopicDetailsTableView.m
//  V-LOVE
//
//  Created by Tony on 15/10/28.
//  Copyright © 2015年 TheFirstDream. All rights reserved.
//

#import "LifeTopicDetailsTableView.h"
#import "LifeTopicDetailsTableViewCell.h"
#import "UIImageView+WebCache.h"


@implementation LifeTopicDetailsTableView 


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        UINib * nib = [UINib nibWithNibName:@"LifeTopicDetailsTableViewCell" bundle:[NSBundle mainBundle]];
        [self registerNib:nib forCellReuseIdentifier:@"cell"];
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TopCell"];
    }
    return self;
}



#pragma mark - UITableViewDelegate;
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //行高 设置
    if (indexPath.section == 0) {
        return 66;
    }else{
        return 55;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"LifeTopic" ofType:@"plist"];
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
        
        //单元格 布局
        //01 图片
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopCell" forIndexPath:indexPath];
        UIImageView * imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 46, 46)];
        [imageView1 sd_setImageWithURL:[NSURL URLWithString:_lifeModel.image_url]];
        
        //02 标题
        UILabel * label1 = [[UILabel alloc]initWithFrame:CGRectMake(70, 10, 200, 22)];
        label1.textColor = [UIColor blackColor];
        label1.font = [UIFont systemFontOfSize:15];
        label1.text = _lifeModel.name;
        
        //03 副标题
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(70, 41, 200, 15)];
        label2.textColor = [UIColor lightGrayColor];
        label2.font = [UIFont systemFontOfSize:11];
        NSString *theKey = [NSString stringWithFormat:@"%@",_lifeModel.category];
        label2.text = dic[theKey];
        
        //添加
        [cell.contentView addSubview:imageView1];
        [cell.contentView addSubview:label1];
        [cell.contentView addSubview:label2];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

    else{
        LifeTopicDetailsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

        LifeDetailModel *model = _data[indexPath.section - 1];
        cell.model = model;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return .1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

//section数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _data.count;
}

//选中单元格
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
