//
//  RecordTableViewCell.h
//  ME
//
//  Created by tarena1 on 16/6/29.
//  Copyright © 2016年 DAEDAE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Combat.h"

@interface RecordTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *game_type;
@property (weak, nonatomic) IBOutlet UILabel *win;
@property (weak, nonatomic) IBOutlet UIImageView *champion_id;


//@property (weak, nonatomic) IBOutlet UILabel *tierLabel;
//@property (weak, nonatomic) IBOutlet UILabel *queueLabel;
//@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
//
//@property (nonatomic, strong) NSDictionary *tierDic;
//@property (nonatomic, strong) NSDictionary *queueDic;
//
//@property (nonatomic, strong) User *user;
//@property (nonatomic, strong) Combat *combat;
@end
