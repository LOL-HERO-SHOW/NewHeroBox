//
//  heroBasicData.h
//  LOLHeroShow
//
//  Created by tarenayj on 16/7/1.
//  Copyright © 2016年 TR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface heroBasicData : NSObject
/*
 "enName": "Taliyah",
 "cnName": "塔莉垭",
 "title": "岩雀",
 "tags": "mage",
 "rating": "1,7,8,5",
 "location": "中单",
 "price": "6300,4500"
 
 */

@property(nonatomic,strong)NSString *enName;//英雄英文名
@property(nonatomic,strong)NSString *cnName;//英雄中文名
@property(nonatomic,strong)NSString *title;//英雄昵称
@property(nonatomic,strong)NSString *tags;//战士 法师 射手
@property(nonatomic,strong)NSString *rating;// 4 维战斗力
@property(nonatomic,strong)NSString *location;//中上野 定位
@property(nonatomic,strong)NSString *price;//价格
@property(nonatomic,strong)NSString *headerImage;//头像


- (instancetype)initWithDic:(NSDictionary *)dic;
@end
