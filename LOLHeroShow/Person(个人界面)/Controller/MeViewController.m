//
//  MeViewController.m
//  ME
//
//  Created by tarena1 on 16/6/29.
//  Copyright © 2016年 DAEDAE. All rights reserved.
//

#import "MeViewController.h"
#import "RecordTableViewCell.h"
#import "SettingViewController.h"
#import "Utils.h"
#import "User.h"
#import "Combat.h"

@interface MeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *recordTableView;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *userLevel;
@property (weak, nonatomic) IBOutlet UILabel *area_ID;
@property (weak, nonatomic) IBOutlet UILabel *tier;
@property (weak, nonatomic) IBOutlet UILabel *power_value;
@property (weak, nonatomic) IBOutlet UILabel *win_point;

@property (weak, nonatomic) IBOutlet UIImageView *icon_id;
@property (weak, nonatomic) IBOutlet UIView *personMessageViewOne;
@property (weak, nonatomic) IBOutlet UIView *personMessageViewTwo;

@property (nonatomic, strong) NSArray *userInfo;
@property (nonatomic, strong) NSArray *combats;
@property (nonatomic, strong) User *personUser;
@property (nonatomic, strong) User *personalMessage;
@property (nonatomic, strong) NSDictionary *tierDic;
@property (nonatomic, strong) NSDictionary *queueDic;
@end


@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.recordTableView.delegate = self;
    self.userInfo = [NSArray array];
    self.combats = [NSArray array];
    self.personUser = [[User alloc]init];
    self.personalMessage = [[User alloc]init];
    
    
    self.navigationItem.title = @"我";
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    UIBarButtonItem *setupButton = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(setUp:)];
    self.navigationItem.rightBarButtonItem = setupButton;
    [self getUserInfo];
    [self.view setNeedsDisplay];
    
}

- (void)setUp:(UIBarButtonItem *)button {
    SettingViewController *settingVC = [[SettingViewController alloc]init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (void)getUserInfo {
    self.tierDic =@{@(0):@"最强王者",@(1):@"钻石",@(2):@"白金",@(3):@"黄金",@(4):@"白银",@(5):@"青铜",@(6):@"大师",@(255):@"无"};
    self.queueDic = @{@(0):@"I",@(1):@"II",@(2):@"III",@(3):@"V",@(4):@"VI",@(255):@"无"};
    //得到用户数据
    [Utils getUserInfoWithCode:@"DAESSI" andCallback:^(id obj) {
        self.userInfo = obj;//根据游戏用户名，得到用户对象数组
        
//        NSLog(@"%@", ((User *)self.userInfo[0]).qquin);
        
        for (User *user in self.userInfo) {
            if (user.area_id.intValue == 27) {
                self.personUser = user;
//                NSLog(@"%@", self.personUser.qquin);
//                NSLog(@"%@", ((User *)self.userInfo[0]).area_id);
            }
        }
        
//        [Utils requestHeadImageWithId:self.personUser.icon_id andCallback:^(id obj) {
//            NSString *path = obj;
//            
////            
////            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:path]];
////            [self.icon_id setImage:[UIImage imageWithData:imageData]];
//        }];
        
        [Utils getUserHotInfoWithQQuin:self.personUser.qquin andVaid:self.personUser.area_id.stringValue andCallback:^(id obj) {
            self.personalMessage = obj;
//                    NSLog(@"self.personalMessage----%@", self.personalMessage.area_id.stringValue);
            self.area_ID.text = [NSString stringWithFormat:@"区服:%@", self.personalMessage.area_id.stringValue];
            self.userLevel.text = [NSString stringWithFormat:@"等级:%@", self.personalMessage.level.stringValue];
            self.power_value.text = [NSString stringWithFormat:@"战斗力:%@", self.personalMessage.power_value.stringValue];
            self.tier.text = [NSString stringWithFormat:@"段位:%@", self.tierDic[self.personalMessage.tier]];
            self.win_point.text = [NSString stringWithFormat:@"胜点:%@", self.personalMessage.win_point.stringValue];
            
            
        }];
        
        [Utils requestCombatListWithQQuin:self.personUser.qquin andVaid:self.personUser.area_id.stringValue andCallback:^(id obj) {
            self.combats = obj;
//            NSLog(@"%@", self.combats);
            [self.recordTableView reloadData];
        }];
        
        
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.combats.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Record"];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"RecordTableViewCell" owner:nil options:nil] lastObject];
    }
//    NSLog(@"%@", self.combats);
    Combat *combat = self.combats[indexPath.row];
    cell.win.text = combat.win.stringValue;
    cell.game_type.text = combat.game_type.stringValue;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
