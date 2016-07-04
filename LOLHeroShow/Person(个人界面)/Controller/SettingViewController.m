//
//  SettingViewController.m
//  ME
//
//  Created by tarena1 on 16/6/29.
//  Copyright © 2016年 DAEDAE. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *settingTableView;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.settingTableView.delegate = self;
}

- (IBAction)LogOut:(UIButton *)sender {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 4;
        default:
            return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = @"绑定大区";
            cell.detailTextLabel.text = @"皮城警备";
            break;
        case 1: {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"消息推送设置";
            }
            else if (indexPath.row == 1) {
                cell.textLabel.text = @"隐私设置";
            }
            else if (indexPath.row == 2) {
                cell.textLabel.text = @"省流量";
                cell.detailTextLabel.text = @"资讯图片自动下载设置";
            }
            else {
                cell.textLabel.text = @"清空缓存";
                cell.detailTextLabel.text = @"0.00M";
            }
        }
            break;
        case 2:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"关于掌盟";
            }
            else {
                cell.textLabel.text = @"意见反馈";
                cell.detailTextLabel.text = @"官方反馈QQ群:332461184";
            }

            break;
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
