//
//  User.m
//  LOLHeroShow
//
//  Created by tarena on 16/6/29.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "User.h"

@implementation User
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.name = dic[@"name"];
        self.icon_id = dic[@"icon_id"];
        self.level = dic[@"level"];
        self.tier = dic[@"tier"];
        self.queue = dic[@"queue"];
        
        self.win_point = dic[@"win_point"];

    }
    return self;
}
@end
