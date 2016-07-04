//
//  MyCell.m
//  LOLHeroShow
//
//  Created by tarena on 16/6/30.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "MyCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setNews:(News *)news
{
    _news = news;
    self.titleLabel.text = news.newstitle;
    self.readCountLabel.text = news.readCount;
    [self.headIV setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",news.photo]]];
    
}

@end
