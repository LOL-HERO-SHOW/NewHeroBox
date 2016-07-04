//
//  heroBasicData.m
//  LOLHeroShow
//
//  Created by tarenayj on 16/7/1.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "heroBasicData.h"

@implementation heroBasicData
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        _enName = dic[@"enName"];
        _cnName = dic[@"cnName"];
        _title = dic[@"title"];
        _tags = dic[@"tags"];
        _rating = dic[@"rating"];
        _location = dic[@"location"];
        _price = dic[@"price"];
        
    }
    return self;
}
@end
