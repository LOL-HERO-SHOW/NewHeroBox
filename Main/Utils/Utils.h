//
//  Utils.h
//  LOLHeroShow
//
//  Created by tarena on 16/6/23.
//  Copyright © 2016年 TR. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Block)(id obj);



@interface Utils : NSObject

+(void)getUserInfoWithCode:(NSString *)gameName andCallback:(Block)callback;
+(void)getUserHotInfoWithQQuin:(NSString *)qquin andVaid:(NSString *)vaid andCallback:(Block)callback;

+(void)requesTVsWithCallback:(Block)callback;



+(void)requestHeadImageWithId:(NSNumber *)icon_id andCallback:(Block)callback;
+(void)requestNewsWithCallback:(Block)callback;
+(void)requestCombatListWithQQuin:(NSString *)qquin andVaid:(NSString *)vaid andCallback:(Block)callback;
@end
