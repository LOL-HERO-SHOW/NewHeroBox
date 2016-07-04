//
//  User.h
//  LOLHeroShow
//
//  Created by tarena on 16/6/29.
//  Copyright © 2016年 TR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSNumber *icon_id;
@property(nonatomic,strong)NSNumber *level;
@property(nonatomic,strong)NSNumber *tier;
@property(nonatomic,strong)NSNumber *queue;
@property(nonatomic,strong)NSNumber *win_point;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
