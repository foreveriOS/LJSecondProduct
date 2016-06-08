//
//  ChatCell.m
//  V-LOVE
//
//  Created by mac on 15/10/28.
//  Copyright (c) 2015年 Anyi. All rights reserved.
//

#import "ChatCell.h"
#import "ChatModel.h"
@implementation ChatCell

//相当于初始化方法
- (void)awakeFromNib {
    
    _chatLabel.font = [UIFont systemFontOfSize:16];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

//子视图的布局
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
//    自适应尺寸设置

    if (_model.isSelf)
    {
        CGSize size = CGSizeMake(210, 1000);
        
        NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16]};
        
        CGRect frame = [_model.content boundingRectWithSize:size
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:attributes
                                                    context:nil];
        
        CGSize contentSize = frame.size;
        
        
        //数据的赋值
        _photo.image = [UIImage imageWithData:_model.icon];
        _photo.contentMode = UIViewContentModeScaleAspectFill;
        _photo.clipsToBounds = YES;

        
        //气泡图拉伸
        UIImage *img = [UIImage imageNamed:@"chat-38@2x"];
        
        img = [img stretchableImageWithLeftCapWidth:20 topCapHeight:20];
        
        //聊天框尺寸设置
        _chatFrame.frame = CGRectMake(KScreenWidth - 45 - (contentSize.width + 40), 7, contentSize.width + 40, contentSize.height + 15);
        
        _chatFrame.image = img;
        
        //聊天文本尺寸自适应
        _chatLabel.frame = CGRectMake(KScreenWidth - 30 - (contentSize.width + 40), 9, contentSize.width + 10, contentSize.height + 10);
        
        _chatLabel.text = _model.content;

    }
    else
    {
        CGSize size = CGSizeMake(210, 1000);
        
        NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16]};
        
        CGRect frame = [_model.content boundingRectWithSize:size
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:attributes
                                                    context:nil];
        
        CGSize contentSize = frame.size;
        
        
        //数据的赋值
        _yourPhoto.image = [UIImage imageWithData:_model.icon];
        
        //气泡图拉伸
        UIImage *img = [UIImage imageNamed:@"chat-37@2x"];
        
        img = [img stretchableImageWithLeftCapWidth:20 topCapHeight:20];
        
        //聊天框尺寸设置
        _yourChatFrame.frame = CGRectMake(45, 7, contentSize.width + 27, contentSize.height + 15);
        
        _yourChatFrame.image = img;
        
        //聊天文本尺寸自适应
        _yourChatLabel.frame = CGRectMake(60, 9, contentSize.width + 10, contentSize.height + 10);
        
        _yourChatLabel.text = _model.content;
    }

}
    
    




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
