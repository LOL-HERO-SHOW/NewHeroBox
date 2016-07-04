//
//  Utils.m
//  LOLHeroShow
//
//  Created by tarena on 16/6/23.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "Utils.h"
#import <AFNetworking.h>
#import "User.h"
#import "News.h"
#import "Combat.h"
@implementation Utils
+(void)getUserInfoWithCode:(NSString *)gameName andCallback:(Block)callback
{
   
    NSString *path = [NSString stringWithFormat:@"http://lolapi.games-cube.com/UserArea?keyword=%@",gameName];//路径
    path = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//[manager.requestSerializer setValue:@"DAIWAN-API-TOKEN" forHTTPHeaderField:@"JBVWJ-KCMUY-GVWLG-VZQBC"];
[manager.requestSerializer setValue:[NSString stringWithFormat:TOKEN] forHTTPHeaderField:@"DAIWAN-API-TOKEN"];

     [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
      NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
         NSMutableArray *userArr = [NSMutableArray array];
//          NSLog(@"%@",dic);
         NSArray *arr = dic[@"data"];
         for (NSDictionary *userDic in arr) {
             User *user = [[User alloc]initWithDic:userDic];
             [userArr addObject:user];
         }
         callback(userArr);
     } failure:nil];
}

+(void)getUserHotInfoWithQQuin:(NSString *)qquin andVaid:(NSString *)vaid andCallback:(Block)callback {
    NSString *path = [NSString stringWithFormat:@"http://lolapi.games-cube.com/UserHotInfo?qquin=%@&vaid=%@", qquin, vaid];
    path = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:[NSString stringWithFormat:TOKEN] forHTTPHeaderField:@"DAIWAN-API-TOKEN"];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//                NSLog(@"%@",dic);
        NSArray *arr = dic[@"data"];
        NSDictionary *dataDic = arr.firstObject;
        User *user = [[User alloc]initWithDic:dataDic];
        callback(user);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

+(void)requestHeadImageWithId:(NSNumber *)icon_id andCallback:(Block)callback
{
    
    NSString *path = [NSString stringWithFormat:@"http://lolapi.games-cube.com/GetUserIcon?iconid=%@",icon_id];//路径
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer setValue:[NSString stringWithFormat:TOKEN] forHTTPHeaderField:@"DAIWAN-API-TOKEN"];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *arr = dic[@"data"];
        NSDictionary *pathDic = arr.firstObject;
        NSString *path = pathDic[@"return"];
        callback(path);
        
    
    } failure:nil];

}

+(void)requesTVsWithCallback:(Block)callback {
    
    NSString *path = @"https://api.weibo.com/2/statuses/timeline_batch.json";
    
    NSDictionary *params = @{@"access_token":@"2.00VKIh4BDj378Ebb514c0e712HdE2D",@"screen_names":@[@"秒拍"]};
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        NSLog(@"%@",dic);
        
        
        
        
               NSLog(@"获取微博列表成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"获取微博列表失败：%@",error);
    }];
    
    
    
    
    
}
+(void)requestNewsWithCallback:(Block)callback
{
    
    NSString *path = @"http://box.dwstatic.com/apiNewsList.php?action=l&newsTag=headlineNews&p=2";
    
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer setValue:[NSString stringWithFormat:TOKEN] forHTTPHeaderField:@"DAIWAN-API-TOKEN"];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];

        NSArray *arr = dic[@"data"];
        NSMutableArray *allNews = [NSMutableArray array];
        
        for (NSDictionary *newDic in arr) {
            
            News *new = [[News alloc]initWithDic:newDic];
            [allNews addObject:new];
            callback(allNews);
        }
        
        
    } failure:nil];
    
}

+(void)requestCombatListWithQQuin:(NSString *)qquin andVaid:(NSString *)vaid andCallback:(Block)callback {
    NSString *path = [NSString stringWithFormat:@"http://lolapi.games-cube.com/CombatList?qquin=%@&vaid=%@&p=1", qquin, vaid];
    path = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setValue:[NSString stringWithFormat:TOKEN] forHTTPHeaderField:@"DAIWAN-API-TOKEN"];

    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSMutableArray *dataArr = [NSMutableArray array];
        NSArray *data = dic[@"data"];
//        NSLog(@"%@", data);
        NSDictionary *dataDic = data.firstObject;

        NSArray *battle_list = dataDic[@"battle_list"];
//        NSLog(@"%@", battle_list);
        for (NSDictionary *battle in battle_list) {
            Combat *combat = [[Combat alloc]initWithDic:battle];
//            NSLog(@"%@", combat);
            [dataArr addObject:combat];
        }
        callback(dataArr);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}


@end
