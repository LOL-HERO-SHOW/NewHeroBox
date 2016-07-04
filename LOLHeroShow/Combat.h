//
//  Combat.h
//  LOLHeroShow
//
//  Created by tarena1 on 16/7/1.
//  Copyright © 2016年 TR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Combat : NSObject

@property (nonatomic, copy) NSString *battle_time;

@property (nonatomic, strong) NSNumber *win;
@property (nonatomic, strong) NSNumber *battle_map;
@property (nonatomic, strong) NSNumber *champion_id;
@property (nonatomic, strong) NSNumber *game_type;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
