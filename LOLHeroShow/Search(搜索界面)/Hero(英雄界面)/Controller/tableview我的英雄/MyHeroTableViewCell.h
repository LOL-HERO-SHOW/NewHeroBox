//
//  MyHeroTableViewCell.h
//  LOLHeroShow
//
//  Created by tarenayj on 16/6/23.
//  Copyright © 2016年 TR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyHeroTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *HeroImageView;
@property (weak, nonatomic) IBOutlet UILabel *HeroName;
@property (weak, nonatomic) IBOutlet UILabel *HeroNickName;
@property (weak, nonatomic) IBOutlet UILabel *UseTimes;

@property (weak, nonatomic) IBOutlet UILabel *WinRate;




+(MyHeroTableViewCell *)cellForTableview:(UITableView *)tableView;
@end
