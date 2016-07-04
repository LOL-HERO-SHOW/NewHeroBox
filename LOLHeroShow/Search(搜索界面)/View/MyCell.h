//
//  MyCell.h
//  LOLHeroShow
//
//  Created by tarena on 16/6/30.
//  Copyright © 2016年 TR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
@interface MyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headIV;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *readCountLabel;
@property(nonatomic,strong)News *news;
@end
