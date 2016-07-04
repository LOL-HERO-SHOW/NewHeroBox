//
//  WeeklyFreeHeroTableViewCell.m
//  LOLHeroShow
//
//  Created by tarenayj on 16/6/23.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "WeeklyFreeHeroTableViewCell.h"

@implementation WeeklyFreeHeroTableViewCell

+(WeeklyFreeHeroTableViewCell *)cellForTableview:(UITableView *)tableView
{
   
    WeeklyFreeHeroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"WeeklyFreeHeroTableViewCell" owner:nil options:nil].lastObject ;
    }
    cell.frame = CGRectMake(0, 0, tableView.frame.size.width, 0);

    return cell;
    
    
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
