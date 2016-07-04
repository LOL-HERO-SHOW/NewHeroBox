//
//  UserTableViewCell.h
//  LOLHeroShow
//
//  Created by tarena on 16/6/29.
//  Copyright © 2016年 TR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface UserTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headIV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabl;

@property (weak, nonatomic) IBOutlet UILabel *LevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *tierLabel;
@property (weak, nonatomic) IBOutlet UILabel *win_pointLabel;
@property (weak, nonatomic) IBOutlet UILabel *queueLabel;
@property(nonatomic,strong)User *user;
@property(nonatomic,strong)NSDictionary *tierDic;
@property(nonatomic,strong)NSDictionary *queueDic;


@end
