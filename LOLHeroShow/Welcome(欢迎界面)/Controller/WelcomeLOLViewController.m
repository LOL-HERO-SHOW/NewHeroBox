//
//  WelcomeLOLViewController.m
//  LOLHeroShow
//
//  Created by tarena43 on 16/6/23.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "WelcomeLOLViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "SearchViewController.h"
#import "MeViewController.h"
#import "HeroShowHubView.h"
@interface WelcomeLOLViewController ()<UIScrollViewDelegate>
/**
 *  创建音乐播放器
 */

@property (nonatomic, strong)AVAudioPlayer *player;
/**
 *  创建滚动页面
 */
@property (nonatomic,strong) UIScrollView *LOLScrollView;
/**
 *  创建翻页
 */
@property (nonatomic,strong) UIPageControl *LOLPageCotrol;

@end


@implementation WelcomeLOLViewController
//实现协议中的代理方法  该方法在scrollView滑动时会调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger pageNum = round(self.LOLScrollView.contentOffset.x/self.LOLScrollView.frame.size.width);
    //设置LOLPageCotrol当前是第几个点被选中
    self.LOLPageCotrol.currentPage = pageNum;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置LOLPageCotrol
    [self configLOLPageControl];
    [self configLOLscrollView];
    //进入欢迎界面的时候播放音乐
    NSString *path = [[NSBundle mainBundle]pathForResource:@"叫我张小歪丶 - 英雄联盟语音串烧-1" ofType:@"mp3"];
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    //播发
    [self.player play];
}
- (void)configLOLPageControl{
    self.LOLPageCotrol= [[UIPageControl alloc] init];
    self.LOLPageCotrol.frame = CGRectMake(0, self.view.frame.size.height- 60, self.view.frame.size.width, 40);
   
    //关闭LOLPageCotrol的交互
    self.LOLPageCotrol.userInteractionEnabled = NO;
    [self.view addSubview:self.LOLPageCotrol];
}
- (void)configLOLscrollView{
    //创建滚动视图
    self.LOLScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    //设置LOLScrollView的代理人位当前控制器
    self.LOLScrollView.delegate = self;
    //大小4个屏幕的宽度
    self.LOLScrollView.contentSize = CGSizeMake(self.view.frame.size.width*4, self.view.frame.size.height);
    //循环创建四个  imageView 并添加到LOLscrollView 中
    for (int i = 0; i < 4; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        //获取当前循环次数  所需的图片名称
        NSString *imageName = [NSString stringWithFormat:@"IMG_145%d",i+3];
        imageView.image = [UIImage imageNamed:imageName];
        //设置imageView的frame
        imageView.frame = CGRectMake(i*self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
        //将创建号的imageView添加到LOLscrollView上
        [self.LOLScrollView addSubview:imageView];
        //在创建最后一个imageView时
        if (i == 3) {
            UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            loginBtn.frame = CGRectMake(imageView.frame.size.width - 80, imageView.frame.size.height - 50 , 60, 30);
            [loginBtn setTitle:@"跳过" forState:UIControlStateNormal];
            loginBtn.tintColor = [UIColor whiteColor];
            
            //设置loginbtn的背景颜色
            loginBtn.backgroundColor = [UIColor clearColor];
            //给Loginbtn添加点击事件
            [loginBtn addTarget:self action:@selector(goLogin:) forControlEvents:UIControlEventTouchUpInside];
            //把最后一个imageView的交互打开
            imageView.userInteractionEnabled = YES;
            [imageView addSubview:loginBtn];
            
        } 
    }
    //去掉水平方向和垂直方向滑动条
    self.LOLScrollView.showsHorizontalScrollIndicator = NO;
    self.LOLScrollView.showsVerticalScrollIndicator = NO;
    //关闭页面的弹性
    self.LOLScrollView.bounces = NO;
    //设置LOLscrollView  为整页滑动
    self.LOLScrollView.pagingEnabled = YES;
    //将LOLScrollView添加到self.view上
    [self.view addSubview:self.LOLScrollView];
    
}

- (void)goLogin:(UIButton*)sender{
    NSLog(@"犯我德邦者,虽远必诛!");
    if (self.player.isPlaying)
        
        [self.player pause];
    
    
    SearchViewController *search =[ [SearchViewController alloc]init];
    search.title = @"搜索";
    UINavigationController *searchNavi = [[UINavigationController alloc]initWithRootViewController:search];
    search.tabBarItem.image = [UIImage imageNamed:@"searchbar_textfield_search_icon@2x"];
    
    MeViewController *me = [MeViewController new];
    me.title = @"我";
     UINavigationController *meNavi = [[UINavigationController alloc]initWithRootViewController:me];
    me.tabBarItem.image = [UIImage imageNamed:@"user@2x"];
    HeroShowHubView *hub =[HeroShowHubView new];
    hub.title = @"英雄";
     UINavigationController *hubNavi = [[UINavigationController alloc]initWithRootViewController:hub];
    hub.tabBarItem.image = [UIImage imageNamed:@"compose_trendbutton_background@2x"];
    UITabBarController *mainTab = [[UITabBarController alloc]init];
    [mainTab addChildViewController:searchNavi];
    [mainTab addChildViewController:hubNavi];
    [mainTab addChildViewController:meNavi];
    
    
    
    
    [self presentViewController:mainTab animated:YES completion:nil];
    
}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
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
