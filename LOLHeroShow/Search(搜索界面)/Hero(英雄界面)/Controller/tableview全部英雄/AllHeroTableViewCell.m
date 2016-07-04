//
//  AllHeroTableViewCell.m
//  LOLHeroShow
//
//  Created by tarenayj on 16/6/23.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "AllHeroTableViewCell.h"

@implementation AllHeroTableViewCell
+(AllHeroTableViewCell *)cellForTableview:(UITableView *)tableView
{
    
    AllHeroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"AllHeroTableViewCell" owner:nil options:nil].lastObject ;
    }
    
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
