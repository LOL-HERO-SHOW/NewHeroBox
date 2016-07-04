//
//  UserInfoTableViewController.h
//  LOLHeroShow
//
//  Created by tarena on 16/6/28.
//  Copyright © 2016年 TR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoTableViewController : UITableViewController
@property(nonatomic,copy)NSString *userID;
@property(nonatomic,strong)NSArray *allUser;
@end
