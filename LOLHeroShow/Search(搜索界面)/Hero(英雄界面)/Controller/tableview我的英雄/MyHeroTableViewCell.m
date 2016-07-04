//
//  MyHeroTableViewCell.m
//  LOLHeroShow
//
//  Created by tarenayj on 16/6/23.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "MyHeroTableViewCell.h"

@implementation MyHeroTableViewCell
+(MyHeroTableViewCell *)cellForTableview:(UITableView *)tableView
{
    
    MyHeroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"MyHeroTableViewCell" owner:nil options:nil].lastObject ;
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
