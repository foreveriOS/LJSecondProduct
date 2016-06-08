//
//  ChatViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "ChatViewController.h"
#import "ChatCell.h"
#import "ChatModel.h"
#import "CoreDataManager.h"
#import "User.h"
@interface ChatViewController (){
    NSMutableArray *_modelArray;
    UITableView *_tableView;
    UIView *_inputView;
    UILabel *label2;
    UIButton *_sendButton;
    UIView *view1;
    UIView *view2;
    CGFloat keyBoardHeight;
    UITextView *_textView;
    BOOL _isSelf;
}

@end

@implementation ChatViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
        _modelArray = [[NSMutableArray alloc]init];
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(ReceiveMessage) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTableView];
    [self creatInputView];
    [self ReceiveMessage];
    [self readCoreData];
    AVObject *testObject = [AVObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];
    //键盘的显示和隐藏
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showKeyBoard:)
                                                 name:UIKeyboardWillChangeFrameNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideKeyBoard:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
- (void)creatTableView{
    //创建表视图
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight - 104) style:UITableViewStylePlain];
    
    //协议数据源
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    
    //将表视图添加到视图控制器
    [self.view addSubview:_tableView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _modelArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    static NSString *identifier = @"MyCell";
    
    ChatCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ChatCell" owner:self options:nil] lastObject];
        
    }
    cell.model = _modelArray[indexPath.row];
    return cell;
    

}

#pragma mark - 设置表视图行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //自适应尺寸设置
    
    CGSize size = CGSizeMake(210, 1000);
    
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16]};
    
    ChatModel *model = _modelArray[indexPath.row];
    
    CGRect frame = [model.content boundingRectWithSize:size
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:attributes
                                               context:nil];
    
    CGSize contentSize = frame.size;
    
    return contentSize.height + 30;
    
    
}


- (void)creatInputView{
    _inputView = [[UIView alloc]initWithFrame:CGRectMake(0, KScreenHeight - 64 - 49, KScreenWidth, 249 )];
    _inputView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_inputView];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(10, 15.5, 18, 18);
    [button1 setImage:[UIImage imageNamed:@"chat-1@2x"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Action:) forControlEvents:UIControlEventTouchUpInside];
    button1.selected = YES;
    [_inputView addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(48, 15.5, 18, 18);
    button2.selected = YES;
    [button2 setImage:[UIImage imageNamed:@"chat-2@2x"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2Action:) forControlEvents:UIControlEventTouchUpInside];
    [_inputView addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(KScreenWidth - 28, 15.5, 18, 18);
    [button3 setImage:[UIImage imageNamed:@"chat-3@2x"] forState:UIControlStateNormal];
    [_inputView addSubview:button3];
    
    _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _sendButton.frame = CGRectMake(KScreenWidth - 60, 2, 60, 47);
    [_sendButton setTitle:@"发送"forState:UIControlStateNormal];
    _sendButton.backgroundColor = [UIColor grayColor];
    [_sendButton addTarget:self action:@selector(sendButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _sendButton.hidden = YES;
    [_inputView addSubview:_sendButton];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(68, 8, KScreenWidth -  68 - 60,39)];
    _textView.delegate = self;
    _textView.font = [UIFont systemFontOfSize:15];
    label2 = [[UILabel alloc]initWithFrame:CGRectMake(3, 7, KScreenWidth,18 )];
    label2.enabled = NO;
    label2.text = @"输入内容";
    label2.font =  [UIFont systemFontOfSize:15];
    label2.textColor = [UIColor lightGrayColor];
    [_textView addSubview:label2];
    [_inputView addSubview:_textView];
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 49, KScreenWidth, 1)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [_inputView addSubview:lineView];
    
    view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 49, KScreenWidth, 200)];
    view1.hidden = YES;
    [_inputView addSubview:view1];
    NSArray *buttonImages = @[@"chat-18@2x",@"chat-19@2x"];
    NSArray *titles = @[@"照片",@"拍照"];
    for (int i = 0; i < 2; i++) {
        CGFloat width = (KScreenWidth - 60 * 4) / 5;
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i * (60 + width) + width, 20, 60, 70)];
        [view1 addSubview:button];
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(19, 15, 22, 20)];
        imageView.image = [UIImage imageNamed:buttonImages[i]];
        [button addSubview:imageView];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 35, 60, 20)];
        label.text = titles[i];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor grayColor];
        [button addSubview:label];
    }
    
    NSArray *faces = @[@"love_emoji_0",@"love_emoji_1",@"love_emoji_2",@"love_emoji_3",@"love_emoji_4",@"love_emoji_5",@"love_emoji_6",@"love_emoji_7",@"love_emoji_8",@"love_emoji_9",@"love_emoji_10",@"love_emoji_11",@"love_emoji_12",@"love_emoji_13",@"love_emoji_14",@"love_emoji_15",@"love_emoji_16",@"love_emoji_17",@"love_emoji_18",@"love_emoji_19",@"love_emoji_20",@"love_emoji_group_delete_btn_nor"];
    view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 49, KScreenWidth, 200)];
    view2.hidden = YES;
    [_inputView addSubview:view2];
    for (int i = 0 ; i < 3; i++) {
        for (int p = 0;  p < 7; p++) {
            CGFloat width = (KScreenWidth - 33*7) / 8;
            UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(width + p * (33 + width), i * (33+ width) + 10, 33, 33)];
            [button setImage:[UIImage imageNamed:faces
                              [p+i*2]] forState:UIControlStateNormal];
            [view2 addSubview:button];
        }
    }
    
    
}
- (void) textViewDidChange:(UITextView *)textView{
    if ( textView.text.length == 0) {
        label2.hidden = NO;
        _sendButton.hidden = YES;
    }else{
        label2.hidden = YES;
        _sendButton.hidden = NO;
    }
}
- (void)button1Action:(UIButton *)button{
    
    [_textView resignFirstResponder];
    if (button.selected) {
    _inputView.frame = CGRectMake(0, KScreenHeight - 64 - 249 , KScreenWidth,  249);
        view1.hidden = NO;
        view2.hidden = YES;
        button.selected = NO;
        
    }else{
        _inputView.frame = CGRectMake(0, KScreenHeight - 64 - 49, KScreenWidth,  249);
        button.selected = YES;
    }
  
}
- (void)button2Action:(UIButton *)button{
    
    [_textView resignFirstResponder];
    
    if (button.selected) {
    _inputView.frame = CGRectMake(0, KScreenHeight - 64 - 249, KScreenWidth,  249);
        view1.hidden = YES;
        view2.hidden = NO;
        button.selected = NO;
    }else{
        _inputView.frame = CGRectMake(0, KScreenHeight - 64 - 49, KScreenWidth, 249);
        button.selected = YES;
    }
    
}
- (void)sendButtonAction:(UIButton *)button{
    [_textView resignFirstResponder];
    //发送消息
    NSString *content = _textView.text;
    ChatModel *model = [[ChatModel alloc]init];
    model.content = content;
     NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kImageName];
    model.icon = data;
    model.isSelf = YES;
    
    //1.添加数据
    [_modelArray addObject:model];
    //2.添加单元格
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_modelArray.count - 1 inSection:0];
    [_tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    //表视图滚动到底部
    [_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    //文本清空
    _textView.text = nil;
    [self sendMessage];

}
- (void)sendMessage{
    
    NSString *ClientId = [[NSUserDefaults standardUserDefaults]objectForKey:kNameText];
    NSLog(@"%@", ClientId);
    
    // Tom 创建了一个 client
    self.client = [[AVIMClient alloc] initWithClientId:@"413"];
   
    // Tom 用自己的名字作为 ClientId 打开 client
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        [self.client createConversationWithName:@"聊天测试" clientIds:@[@"414"] callback:^(AVIMConversation *conversation, NSError *error) {
//            Tom 发了一条消息给 Jerry
//            NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kImageName];

            ChatModel *model = [_modelArray lastObject];
            
            [conversation sendMessage:[AVIMTextMessage messageWithText:model.content attributes:nil] callback:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@"发送成功！");
                }
                
            }];
        }];
    }];
    

    
}
- (void)ReceiveMessage{
    
    // Jerry 用自己的名字作为 ClientId 打开了 client
    NSString *ClientId = [[NSUserDefaults standardUserDefaults]objectForKey:kNameText];
    
    self.client = [[AVIMClient alloc] initWithClientId:@"413"];
    
    // 设置 client 的 delegate，并实现 delegate 方法
    self.client.delegate = self;
    
    // Jerry 打开 client
    [self.client openWithCallback:^(BOOL succeeded, NSError *error) {
        // ...
    }];
}
#pragma mark - AVIMClientDelegate

// 接收消息的回调函数
- (void)conversation:(AVIMConversation *)conversation didReceiveTypedMessage:(AVIMTypedMessage *)message {
    
    NSLog(@"%@", message.text); // 耗子，起床！
    ChatModel *model = [[ChatModel alloc] init];
    model.content = message.text;
    model.isSelf = NO;
    [_modelArray addObject:model];
    [_tableView reloadData];
}
#pragma mark - 键盘的显示
- (void)showKeyBoard:(NSNotification *)noti{
    //获取键盘的高度
    NSValue *value = [noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    //转成CGRect的frame
    CGRect frame = [value CGRectValue];
    
    //获取键盘的高度
    keyBoardHeight = frame.size.height;
    
    //表视图和视图上移键盘的高度
    [UIView animateWithDuration:0.3 animations:^{
        _inputView.frame = CGRectMake(0, KScreenHeight - 64 - keyBoardHeight - 49, KScreenWidth, keyBoardHeight + 49);
    
    }];
}

#pragma mark - 键盘的隐藏
- (void)hideKeyBoard:(NSNotification *)noti{
    [UIView animateWithDuration:0.2 animations:^{
         _inputView.frame = CGRectMake(0, KScreenHeight - 64 - 49, KScreenWidth,49);

    }];
}
//CoreData数据持久化 保存数据
- (void)SaveCoreData{
    CoreDataManager *manager = [CoreDataManager defaultManager];
    User *user = (User *)[manager createMO:@"User"];
    ChatModel *model = [_modelArray lastObject];
    user.content = model.content;
    [manager addManagedObject:user];
}
// 读取数据
- (void)readCoreData{
    CoreDataManager *manager = [CoreDataManager defaultManager];
    NSArray *array = [manager query:@"User" predicate:nil];
    for (User *user in array) {
        ChatModel *model = [[ChatModel alloc]init];
        model.isSelf = YES;
        model.content = user.content;
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kImageName];
        model.icon = data;
        [_modelArray addObject:model];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
