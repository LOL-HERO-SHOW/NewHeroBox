//
//  WeeklyFreeHeroTableViewCell.h
//  LOLHeroShow
//
//  Created by tarenayj on 16/6/23.
//  Copyright © 2016年 TR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeeklyFreeHeroTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *LeftImageview;//左边 头像
@property (weak, nonatomic) IBOutlet UILabel *LeftNameLabel;//左边 英雄名字
@property (weak, nonatomic) IBOutlet UILabel *LeftNickNameLabel;//左边 英雄昵称
@property (weak, nonatomic) IBOutlet UILabel *LeftHeroTypeLabel;//左边 英雄类型

@property (weak, nonatomic) IBOutlet UIImageView *RightImageview;
@property (weak, nonatomic) IBOutlet UILabel *RightNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *RightNickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *RightHeroTypeLabel;


+(WeeklyFreeHeroTableViewCell *)cellForTableview:(UITableView *)tableView;//复用方法
@end
