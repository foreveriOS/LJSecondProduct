//
//  personalViewController.m
//  V-LOVE
//
//  Created by mac on 15/10/15.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "personalViewController.h"

@interface personalViewController (){
    UITableView *_table;
    UIImageView *_headView;
    UILabel *_genderLabel;
    UITextView *nameText;
    
}

@end

@implementation personalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTableView];
   
    
}
- (void)creatTableView{
    _table = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _table.dataSource = self;
    _table.delegate = self;
    _table.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_table];
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, _table.bottom, KScreenWidth, kScreenHeight)];
//    [self.view addSubview:view];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
//    [view addGestureRecognizer:tap];
}

//- (void)tapAction{
//    [nameText resignFirstResponder];
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
        return 3;
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *array = @[@"更改头像",@"昵称",@"性别"];
    static NSString *indentifil = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifil];
        cell.textLabel.text = array[indexPath.row];
    }
    if(indexPath.row < 1){
        cell.accessoryType = UITableViewCellAccessoryNone;

    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row == 0) {
        _headView = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth - 60 , 10, 30, 30)];
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kImageName];
        _headView.image = [UIImage imageWithData:data];
        _headView.contentMode = UIViewContentModeScaleAspectFill;
        _headView.clipsToBounds = YES;
        if (_headView.image == nil) {
            _headView.image = [UIImage imageNamed:@"setting-1@2x"];
        }
        _headView.layer.cornerRadius = 15;
        _headView.clipsToBounds = YES;
        [cell addSubview:_headView];
        
    }else if(indexPath.row == 1){
        nameText = [[UITextView alloc]initWithFrame:CGRectMake(100, 10, KScreenWidth - 130, 30)];
       NSString *nameString = [[NSUserDefaults standardUserDefaults]objectForKey:kNameText];
        nameText.text = nameString;
        nameText.delegate = self;
        nameText.textAlignment = NSTextAlignmentRight;
        [cell addSubview:nameText];
     
    }else if(indexPath.row == 2){
        _genderLabel = [[UILabel alloc]initWithFrame:CGRectMake(KScreenWidth - 50, 10, 30, 30)];
        _genderLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:Kgender];
        
        [cell addSubview:_genderLabel];
        
    }
    cell.selectionStyle = NO;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"相册", nil];
        sheet.tag = 1;
        [sheet showInView:self.view];
  
    }else if(indexPath.section == 0 && indexPath.row == 2){
        
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"男",@"女", nil];
        sheet.tag = 2;
        [sheet showInView:self.view];

    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    UIImagePickerControllerSourceType sourceType;
    if (actionSheet.tag == 1) {
    if (buttonIndex == 0) {
        sourceType = UIImagePickerControllerSourceTypeCamera;
        BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
        if (!isCamera) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"摄像头无法使用" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            [alertView show];
            return;
        }
    }else if(buttonIndex == 1){
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }else{
        return;
    }
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
    }else{
        if (buttonIndex == 0) {
            _genderLabel.text = @"男";
            [[NSUserDefaults standardUserDefaults]setValue:@"男" forKey:Kgender];
            [[NSUserDefaults standardUserDefaults]synchronize];
    
        }else if(buttonIndex == 1){
            _genderLabel.text = @"女";
            [[NSUserDefaults standardUserDefaults]setValue:@"女" forKey:Kgender];
            [[NSUserDefaults standardUserDefaults]synchronize];
        }else{
            return;
        }
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //获取选择的图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    _headView.image = image;
    //数据 持久化处理
    NSData *data = UIImageJPEGRepresentation(image, 1);
    [self UseNSUserDefaults:data forKey:kImageName];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)textViewDidChange:(UITextView *)textView{
    nameText.text = textView.text;
    [[NSUserDefaults standardUserDefaults] setObject:textView.text forKey:kNameText];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
