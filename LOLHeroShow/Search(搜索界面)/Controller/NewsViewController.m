//
//  NewsViewController.m
//  LOLHeroShow
//
//  Created by tarena on 16/6/30.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "NewsViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
@interface NewsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *headIV;
@property (weak, nonatomic) IBOutlet UITextView *contentLabel;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.news.newstitle;
    [self.headIV setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.news.srcPhoto]]];
    [self.headIV setContentMode:UIViewContentModeScaleAspectFill];
    //让控件超出范围不显示
    self.headIV.clipsToBounds = YES;

    self.contentLabel.text = [NSString stringWithFormat:@"      %@",self.news.content];
    
    
}
-(void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
