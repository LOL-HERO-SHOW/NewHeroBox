//
//  RecordTableViewCell.m
//  ME
//
//  Created by tarena1 on 16/6/29.
//  Copyright © 2016年 DAEDAE. All rights reserved.
//

#import "RecordTableViewCell.h"
#import "Utils.h"
#import "Combat.h"

@implementation RecordTableViewCell

- (void)awakeFromNib {
//    self.tierDic =@{@(0):@"最强王者",@(1):@"钻石",@(2):@"白金",@(3):@"黄金",@(4):@"白银",@(5):@"青铜",@(6):@"大师",@(255):@"无"};
//    self.queueDic = @{@(0):@"I",@(1):@"II",@(2):@"III",@(3):@"V",@(4):@"VI",@(255):@"无"};
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

//- (void)setCombat:(Combat *)combat {
//    _combat = combat;
//    self.tierLabel.text = combat.battle_map.stringValue;
//    
//}
//
//- (void)setUser:(User *)user {
//    _user = user;
//    [Utils getUserInfoWithCode:@"DAESSI" andCallback:^(id obj) {
//        NSArray *userInfo = [NSArray array];
//        User *personUser = [User alloc];
//        userInfo = obj;//根据游戏用户名，得到用户对象数组
//        
//        //        NSLog(@"%@", ((User *)self.userInfo[0]).qquin);
//        
//        for (User *user in userInfo) {
//            if (user.area_id.intValue == 27) {
//                personUser = user;
//                //                NSLog(@"%@", self.personUser.qquin);
//                //                NSLog(@"%@", ((User *)self.userInfo[0]).area_id);
//            }
//        }
//        
//        [Utils requestHeadImageWithId:personUser.icon_id andCallback:^(id obj) {
//            NSString *path = obj;
//            
//            //
//            //            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:path]];
//            //            [self.icon_id setImage:[UIImage imageWithData:imageData]];
//        }];
//        
//        [Utils requestCombatListWithQQuin:personUser.qquin andVaid:personUser.area_id.stringValue andCallback:^(id obj) {
//            NSArray *combatArr = [NSArray array];
//            combatArr = obj;
//            Combat *combat = [[Combat alloc]init];
//            combat = combatArr[]
//            self.tierLabel.text = self.tierDic[]
//        }];
//
//        
//        
//    }];
//}

@end
