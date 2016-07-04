//
//  UserTableViewCell.m
//  LOLHeroShow
//
//  Created by tarena on 16/6/29.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "UserTableViewCell.h"
#import "Utils.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
@implementation UserTableViewCell

- (void)awakeFromNib {
   self.tierDic =@{@(0):@"最强王者",@(1):@"钻石",@(2):@"白金",@(3):@"黄金",@(4):@"白银",@(5):@"青铜",@(6):@"大师",@(255):@"无"};
    self.queueDic = @{@(0):@"I",@(1):@"II",@(2):@"III",@(3):@"V",@(4):@"VI",@(255):@"无"};
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setUser:(User *)user
{
       _user = user;
  
    self.nameLabl.text = user.name;
    self.tierLabel.text = self.tierDic[user.tier];
    self.LevelLabel.text = user.level.stringValue;
    
    self.queueLabel.text = self.queueDic[user.queue];
    self.win_pointLabel.text = user.win_point.stringValue;
    [Utils requestHeadImageWithId:user.icon_id andCallback:^(id obj) {
        NSString *path = obj;
        NSLog(@"%@", path);
        [self.headIV setImageWithURL:[NSURL URLWithString:path]];
        
    }];
    
}
@end
