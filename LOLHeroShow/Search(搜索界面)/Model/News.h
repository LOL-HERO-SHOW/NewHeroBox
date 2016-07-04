//
//  News.h
//  LOLHeroShow
//
//  Created by tarena on 16/6/30.
//  Copyright © 2016年 TR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
@property(nonatomic,copy)NSString *newstitle;
@property(nonatomic,copy)NSString *readCount;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *srcPhoto;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
