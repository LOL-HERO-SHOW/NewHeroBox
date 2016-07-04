//
//  Combat.m
//  LOLHeroShow
//
//  Created by tarena1 on 16/7/1.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "Combat.h"

@implementation Combat
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.battle_time = dic[@"battle_time"];
        
        self.win = dic[@"win"];
        self.battle_map = dic[@"battle_map"];
        self.battle_time = dic[@"champion_id"];
        self.game_type = dic[@"game_type"];
    }
    return self;
}
@end
