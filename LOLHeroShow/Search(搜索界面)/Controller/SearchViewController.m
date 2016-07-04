//
//  SearchViewController.m
//  LOLHeroShow
//
//  Created by tarena on 16/6/23.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "SearchViewController.h"
#import "HeroShowHubView.h"
#import "UserInfoTableViewController.h"
#import "Utils.h"
#import "NewsViewController.h"
#import "MyCell.h"
@interface SearchViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *videos;
@property(nonatomic,strong)UITextField *searchTF;
@property(nonatomic,strong)UIScrollView *sv;
@property(nonatomic,strong)UIPageControl *pageView;
@property(nonatomic)int pageNum;
@property(nonatomic,strong)NSTimer *t;

@end

@implementation SearchViewController
static NSString * const reuseIdentifier = @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
     
    [self addSearch];
    [self addTableView];
    [self addscrollView];
    self.sv.delegate = self;
   [self configPageControl];
   [Utils requestNewsWithCallback:^(id obj) {
       self.news = obj;
       [self.tableView reloadData];
   }];
    [self.tableView registerNib:[UINib nibWithNibName:@"MyCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
   

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.t = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(move) userInfo:nil repeats:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [self.t  invalidate];
}
-(void)move
{
    self.pageNum++;
    int x = self.pageNum%4;
    self.sv.contentOffset = CGPointMake(self.view.frame.size.width*x, 0);
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.pageNum = round(self.sv.contentOffset.x / self.sv.frame.size.width);
    
    self.pageView.currentPage = self.pageNum;

}
-(void)addTableView
{
    
    
    CGRect fram = CGRectMake(0, 250, self.view.frame.size.width, self.view.frame.size.height-250-50);
    self.tableView = [[UITableView alloc]initWithFrame:fram style:UITableViewStylePlain];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   
    
    [self.view addSubview:self.tableView];
    
}
-(void)addSearch
{
   

    UIView *v1 = [[UIView alloc]initWithFrame:CGRectMake(20, 74, 275, 25)];
   
    v1.layer.borderWidth = 1;
    v1.layer.borderColor = [UIColor blackColor].CGColor ;
    v1.layer.cornerRadius = 5;
    v1.layer.masksToBounds = YES;
    
    self.searchTF = [[UITextField alloc]initWithFrame:CGRectMake(25, 0, 250, 25)];
    self.searchTF.placeholder = @"召唤师查询";
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 15, 15)];
    iv.image = [UIImage imageNamed:@"Search (1)"];
    [v1 addSubview:iv];
    [v1 addSubview:self.searchTF];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(300, 74, 50, 25)];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [btn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"搜索" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [self.view addSubview:v1];
    
}
-(void)addscrollView
{
    self.sv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 110,self.view.frame.size.width , 136)];
    self.sv.backgroundColor = [UIColor greenColor];
    self.sv.contentSize = CGSizeMake(4*self.sv.frame.size.width, self.sv.frame.size.height);
    for (int i = 0; i <4; i++) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(i*self.sv.frame.size.width, 0, self.sv.frame.size.width, self.sv.frame.size.height)];
        iv.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(new)];
        [iv  addGestureRecognizer:tap];
        
        iv.userInteractionEnabled = YES;
        [self.sv addSubview:iv];
    }
    self.sv.showsHorizontalScrollIndicator = NO;
    self.sv.showsVerticalScrollIndicator = NO;
    //关闭弹性
    self.sv.bounces = NO;
    
    //设置 scrollView 整页滑动
    self.sv.pagingEnabled = YES;

    
    [self.view addSubview:self.sv];
    
    
    
}
-(void)new
{
    //手势
    
}
-(void)configPageControl {
    self.pageView = [[UIPageControl alloc]init];
    self.pageView.frame = CGRectMake(0, self.sv.frame.size.height+110-15, self.sv.frame.size.width, 10);
   
    self.pageView.numberOfPages = 4;
   
    self.pageView.currentPage = 0;

    self.pageView.pageIndicatorTintColor = [UIColor redColor];
    
    self.pageView.currentPageIndicatorTintColor = [UIColor greenColor];
    
   
    
    [self.view addSubview:self.pageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)search
{
    UserInfoTableViewController *vc = [UserInfoTableViewController new];
    vc.userID = self.searchTF.text;
    
    [self presentViewController:[[UINavigationController alloc]initWithRootViewController:vc] animated:YES completion:nil];
     
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.news.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.news = self.news[indexPath.row];
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    News *new = self.news[indexPath.row];
    NewsViewController *vc = [NewsViewController new];
    vc.news = new;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
