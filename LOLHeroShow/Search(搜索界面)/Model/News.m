//
//  News.m
//  LOLHeroShow
//
//  Created by tarena on 16/6/30.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "News.h"

@implementation News
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.newstitle = dic[@"title"];
        self.readCount = dic[@"readCount"];
        self.content = dic[@"content"];
        self.photo = dic[@"photo"];
        self.srcPhoto = dic[@"srcPhoto"];
        
    }
    return self;
}


@end
