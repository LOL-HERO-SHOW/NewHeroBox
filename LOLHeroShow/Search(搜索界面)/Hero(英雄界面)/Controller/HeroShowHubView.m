//
//  HeroShowHubView.m
//  LOLHeroShow
//
//  Created by tarenayj on 16/6/26.
//  Copyright © 2016年 TR. All rights reserved.
//

#import "HeroShowHubView.h"
#import "requestTool.h"
#import <UIImageView+AFNetworking.h>
#import "heroBasicData.h"
#define SCROLLWIDTH self.scrollView.frame.size.width





//表格的cell
#import "MyHeroTableViewCell.h"
#import "AllHeroTableViewCell.h"
#import "WeeklyFreeHeroTableViewCell.h"

@interface HeroShowHubView ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,JSDropDownMenuDataSource,JSDropDownMenuDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myHero;
@property (weak, nonatomic) IBOutlet UITableView *weeklyHero;
@property (weak, nonatomic) IBOutlet UITableView *allHero;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
//滚动视图 切换按钮 (用于设置 按钮选中状态)
@property (weak, nonatomic) IBOutlet UIButton *myHeroButton;

@property (weak, nonatomic) IBOutlet UIButton *weeklyButton;

@property (weak, nonatomic) IBOutlet UIButton *allHeroButton;



@property (copy, nonatomic)NSArray *OldAllHeroArr;

//data =     (
//            {
//                "avg_a_num" = 1008;
//                "avg_d_num" = 749;
//                "avg_k_num" = 795;
//                "champion_id" = 64;
//                "gold_earned_per_min" = 36809;
//                kda = 722;
//                "minions_killed_per_min" = 319;
//                rank = 1;
//                "use_ratio" = 456;
//                "win_ratio" = 4708;
//            },

//请求回来的全英雄列表 里面装着字典
@property (strong, nonatomic)NSArray *AllHeroArr;

//周免
@property (strong, nonatomic)NSArray *WeeklyHeroArr;

//用户(我的)英雄
@property(strong,nonatomic)NSArray *MyHeroArr;











@end

@implementation HeroShowHubView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    //分别代理 数据源 设置为 类 为何不行
//    myHeroTableView *my=[myHeroTableView new];
//   self.myHero.delegate = my;
//    self.myHero.dataSource = my;
//    
//    weeklyFreeHeroTableView *week = [weeklyFreeHeroTableView new];
//    self.weeklyHero.delegate = week;
//    self.weeklyHero.dataSource = week;
//    
//    AllHeroTableView *all = [AllHeroTableView new];
//   self.allHero.delegate = all;
//    self.allHero.dataSource = all;
    
//    请求全英雄数据
   [requestTool requestNewAllHeroCallBack:^(id obj) {
       
       self.OldAllHeroArr=self.AllHeroArr = obj;
       [self.allHero reloadData];
       
       
   }];
  
    //请求周免英雄数据
    [requestTool requestNewWeeklyHeroCallBack:^(id obj) {
        
        
      
        
        self.WeeklyHeroArr = obj;
        
        [self.weeklyHero reloadData];

        
    }];
    
    //请求我的英雄数据
    
    [requestTool requestQQuid:@"U13267560124171473800" Vaid:@"22" HeroCallBack:^(id obj) {
        
        NSArray *arr  = obj;
        NSDictionary *myd = arr[3];
        self.MyHeroArr = myd[@"champion_list"];
        [self.myHero reloadData];
    }];
    
    
    //设置滚动view
    self.scrollView.contentSize = CGSizeMake(3*SCROLLWIDTH,1);//内容高度=0 没有垂直滚动  self.view.frame.size.height-100
    
    self.myHero.frame = CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    [self.scrollView addSubview:self.myHero];
    
    self.weeklyHero.frame = CGRectMake(SCROLLWIDTH, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
     [self.scrollView addSubview:self.weeklyHero];
    
    
    
    self.allHero.frame = CGRectMake(SCROLLWIDTH*2, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    
     [self.scrollView addSubview:self.allHero];
    //进页面 我的英雄 按钮 是选中的 显示 我的英雄tableview
    self.myHeroButton.selected = YES;
    
    [self initMenu];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//滚动视图 切换按钮

- (IBAction)myHeroButton:(id)sender {
    
    
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    
//  self.myHeroButton.selected = YES;
//   self.weeklyButton.selected = NO;
//    self.allHeroButton.selected = NO;

}

- (IBAction)weeklyHeroButton:(id)sender {
    [self.scrollView setContentOffset:CGPointMake(SCROLLWIDTH, 0) animated:NO];
//    self.myHeroButton.selected = NO;
//    self.weeklyButton.selected = YES;
//    self.allHeroButton.selected = NO;
 
}

- (IBAction)allHeroButton:(id)sender {
    [self.scrollView setContentOffset:CGPointMake(SCROLLWIDTH*2, 0) animated:NO];
//    self.myHeroButton.selected = NO;
//    self.weeklyButton.selected = NO;
//    self.allHeroButton.selected = YES;
    
    

}

//滚动视图 发生改变的时候(代理方法) 改变按钮的选中状态
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //只有当 主scollview 滚动的时候 才改变(taibleview 也是scrollview  所以要限定是 主scollvew)
    if (self.scrollView.contentOffset.x==0) {
        self.myHeroButton.selected = YES;
        self.weeklyButton.selected = NO;
        self.allHeroButton.selected = NO;

        
    }else if (self.scrollView.contentOffset.x==SCROLLWIDTH) {
        self.myHeroButton.selected = NO;
        self.weeklyButton.selected = YES;
        self.allHeroButton.selected = NO;
        
    }else if (self.scrollView.contentOffset.x==SCROLLWIDTH*2) {
        self.myHeroButton.selected = NO;
        self.weeklyButton.selected = NO;
        self.allHeroButton.selected = YES;

        
    }
    
}

//表格数据设置
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //tag 0 是我的英雄 ,1 是周免 2 是全英雄
    if (tableView.tag == 2) {
        //全英雄来设置行数
        
        return self.AllHeroArr.count/2;
    }else if (tableView.tag == 1) {
               return self.WeeklyHeroArr.count/2;
    }
   
    else{
        NSLog(@"-----%ld",self.MyHeroArr.count);
        return self.MyHeroArr.count;
    }

    
    
//    if ([self.allHero isEqual:tableView]) //方法:222222
//    {
//                //全英雄来设置行数
//                      return self.AllHeroArr.count;
//            }

   

}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.myHero isEqual:tableView]) {//我的英雄表设置
        
    
    MyHeroTableViewCell *cell = [MyHeroTableViewCell cellForTableview:tableView];
        
        NSString *champion_id =   self.MyHeroArr[indexPath.row][@"champion_id"];
        
        [requestTool requestHeroNameWithHeroID:champion_id CallBack:^(id obj) {
            
            NSArray *arr = obj;
            NSDictionary *ddd = arr[0];
            
            cell.HeroName.text = ddd[@"return"];
            [cell.layer needsLayout];
            
        }];
        
        cell.HeroNickName.text= [self.MyHeroArr[indexPath.row][@"champion_id"] stringValue];
        cell.UseTimes.text = [self.MyHeroArr[indexPath.row][@"use_num"] stringValue];
        cell.WinRate.text = [self.MyHeroArr[indexPath.row][@"win_num"] stringValue];
        
        NSString *imagePath = [NSString stringWithFormat:@"http://cdn.tgp.qq.com/pallas/images/champions_id/%@.png",champion_id];
        [cell.HeroImageView setImageWithURL:[NSURL URLWithString:imagePath]];
        
        //添加点击事件
        cell.HeroImageView.tag = champion_id.intValue;//用tag值传参数到点击事件里面
        cell.HeroImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(UesrClicked:)];
        [cell.HeroImageView addGestureRecognizer:singleTap];

        
    
    return cell;
    }else
    if ([self.weeklyHero isEqual:tableView]) {//周免英雄表设置
        
        
        WeeklyFreeHeroTableViewCell *cell = [WeeklyFreeHeroTableViewCell cellForTableview:tableView];
      
        heroBasicData *hero1 = self.WeeklyHeroArr[indexPath.row*2+1];
        
        
        cell.LeftHeroTypeLabel.text = hero1.tags;//英雄 类型
        
        //添加点击事件
        cell.LeftImageview.tag = indexPath.row*2+1;//用tag值传参数到点击事件里面
        cell.LeftImageview.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(UesrClicked1:)];
        [cell.LeftImageview addGestureRecognizer:singleTap];
        
        
        
        cell.LeftNickNameLabel.text = hero1.cnName;//中文名
        cell.LeftNameLabel.text = hero1.title;
        NSString *imagePath1 = [NSString stringWithFormat:@"http://ossweb-img.qq.com/images/lol/img/champion/%@.png",hero1.enName];
        [cell.LeftImageview setImageWithURL:[NSURL URLWithString:imagePath1]];
        
     
        ////////////////////////////////////
       
            heroBasicData *hero2 = self.WeeklyHeroArr[indexPath.row*2+2];
            
            
            cell.RightHeroTypeLabel.text = hero2.tags;//英雄 类型
            
            //添加点击事件
            cell.RightImageview.tag = indexPath.row*2+2;//右边
            cell.RightImageview.userInteractionEnabled = YES;
            UITapGestureRecognizer *singleTap2 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(UesrClicked1:)];
            [cell.RightImageview addGestureRecognizer:singleTap2];
            
            
            
            cell.RightNickNameLabel.text = hero2.cnName;//中文名
            cell.RightNameLabel.text = hero2.title;
            
            
            NSString *imagePath2 = [NSString stringWithFormat:@"http://ossweb-img.qq.com/images/lol/img/champion/%@.png",hero2.enName];
            [cell.RightImageview setImageWithURL:[NSURL URLWithString:imagePath2]];
       

        
        return cell;
        
        
        
    }else
        {//所有英雄表设置
        //因为和weekly 的 cell 一样 所以复用
            WeeklyFreeHeroTableViewCell *cell = [WeeklyFreeHeroTableViewCell cellForTableview:tableView];
            
                //一行 2个英雄   所以  有 count/2 行
            
                
                heroBasicData *hero1 = self.AllHeroArr[indexPath.row*2];
            
            
            cell.LeftHeroTypeLabel.text = hero1.tags;//英雄 类型
         
              //添加点击事件
            cell.LeftImageview.tag = indexPath.row*2;//左边
            cell.LeftImageview.userInteractionEnabled = YES;
            UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(UesrClicked:)];
            [cell.LeftImageview addGestureRecognizer:singleTap];
            
            
            
            cell.LeftNickNameLabel.text = hero1.cnName;//中文名
            cell.LeftNameLabel.text = hero1.title;
            NSString *imagePath1 = [NSString stringWithFormat:@"http://ossweb-img.qq.com/images/lol/img/champion/%@.png",hero1.enName];
            [cell.LeftImageview setImageWithURL:[NSURL URLWithString:imagePath1]];
            
            //  ??***********************  ??***********************

            
                heroBasicData *hero2 = self.AllHeroArr[indexPath.row*2+1];
                
                
                cell.RightHeroTypeLabel.text = hero1.tags;//英雄 类型
                
                //添加点击事件
                cell.RightImageview.tag = indexPath.row*2+1;//右边
                cell.RightImageview.userInteractionEnabled = YES;
                UITapGestureRecognizer *singleTap2 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(UesrClicked:)];
                [cell.RightImageview addGestureRecognizer:singleTap2];
                
                
               
                cell.RightNickNameLabel.text = hero2.cnName;//中文名
                cell.RightNameLabel.text = hero2.title;
                
                
                NSString *imagePath2 = [NSString stringWithFormat:@"http://ossweb-img.qq.com/images/lol/img/champion/%@.png",hero2.enName];
                [cell.RightImageview setImageWithURL:[NSURL URLWithString:imagePath2]];
           
          
                //http://cdn.tgp.qq.com/pallas/images/champions_id/101.png 英雄头像
        
        
        return cell;
    }

    
    
    
    
}


-(void)UesrClicked:(UITapGestureRecognizer *)singleTap//所有英雄跳转
{
    UIImageView *iv = (UIImageView *)singleTap.view;//获得点击事件所在的view
    
    heroBasicData *hero1 = self.AllHeroArr[iv.tag];
       NSLog(@"%@",hero1.enName);
    
}

-(void)UesrClicked1:(UITapGestureRecognizer *)singleTap//周免英雄跳转
{
    UIImageView *iv = (UIImageView *)singleTap.view;//获得点击事件所在的view
    
    heroBasicData *hero1 = self.WeeklyHeroArr[iv.tag];
    NSLog(@"%@",hero1.enName);
    
}










-(NSString *)heroName:( NSString *)champion_id
{
   __block NSString* name = nil;
 [requestTool requestHeroNameWithHeroID:champion_id CallBack:^(id obj) {
                             
    NSArray *arr = obj;
    NSDictionary *ddd = arr[0];
    name = ddd[@"return"];
     
     
 }];
    return name;
                             
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
















- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 2) {
       
         return self.menu;
    }
    return nil;
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 2) {
        return 45;
    }
    return 0;
}

#pragma mark *********菜单*********



-(void)initMenu
{
    self.currentData1Index = 0;
    self.currentData1SelectedIndex = 0;
    
    NSArray *food = @[@"全部类型", @"战士", @"法师", @"刺客", @"辅助",@"射手",@"坦克",];
    NSArray *travel = @[@"全部位置", @"上单", @"中单", @"打野", @"ADC",@"辅助"];
    
    self.data1 = [NSMutableArray arrayWithObjects:@{@"title":@"类型", @"data":food}, @{@"title":@"位置", @"data":travel}, nil];
    self.data2 = [NSMutableArray arrayWithObjects:@"价格不限", @"450", @"1350", @"3150", @"4800", @"6300", @"7800", nil];
    self.data3 = [NSMutableArray arrayWithObjects:@"默认排序", @"物理", @"法伤", @"防御",@"操作", nil];
    
    self.menu = [[JSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:45];
    self.menu.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
    self.menu.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
    self.menu.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
    self.menu.dataSource = self;
    self.menu.delegate = self;
    
    //self.allHero.tableHeaderView= self.menu;
    
}


- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu {
    
    return 3;//3个选项卡
}

-(BOOL)displayByCollectionViewInColumn:(NSInteger)column{
    
    if (column==2) {
        
        return YES;
    }
    
    return NO;
}

-(BOOL)haveRightTableViewInColumn:(NSInteger)column{
    
    if (column== 0) {
        return YES;
    }
    return NO;
}

-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column{
    
    if (column==0) {
        return 0.3;
    }
    
    return 1;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{//当前选择行
    //row 行             column 列
    if (column==0) {
        
        return self.currentData1Index;
        
    }
    if (column==1) {
        
        return self.currentData2Index;
    }
    
    return 0;
}

- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    
    if (column==0) {
        if (leftOrRight==0) {
            
            return self.data1.count;
        } else{
            
            NSDictionary *menuDic = [self.data1 objectAtIndex:leftRow];
            return [[menuDic objectForKey:@"data"] count];
        }
    } else if (column==1){
        
        return self.data2.count;
        
    } else if (column==2){
        
        return self.data3.count;
    }
    
    return 0;
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column{
    
    switch (column) {
        case 0: return [[self.data1[self.currentData1Index] objectForKey:@"data"] objectAtIndex:self.currentData1SelectedIndex];
            break;
        case 1: return self.data2[self.currentData2Index];
            break;
        case 2: return self.data3[self.currentData3Index];
            break;
        default:
            return nil;
            break;
    }
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath {
    
    if (indexPath.column==0) {
        if (indexPath.leftOrRight==0) {
            NSDictionary *menuDic = [self.data1 objectAtIndex:indexPath.row];
            return [menuDic objectForKey:@"title"];
        } else{
            NSInteger leftRow = indexPath.leftRow;
            NSDictionary *menuDic = [self.data1 objectAtIndex:leftRow];
            return [[menuDic objectForKey:@"data"] objectAtIndex:indexPath.row];
        }
    } else if (indexPath.column==1) {
        
        return self.data2[indexPath.row];
        
    } else {
        
        return self.data3[indexPath.row];
    }
}

- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath {
                    NSString *str = nil;
    if (indexPath.column == 0) {
        
        if (indexPath.leftRow == 0) {//类型
            
            switch (indexPath.row) {
                case 0://全部类型
                    
                    break;
                case 1://战士
                    str = @"fighter";
                    break;
                case 2://法师
                    str = @"mage";
                    break;
                case 3://刺客
                    str = @"assassin";
                    break;
                case 4://辅助
                    str = @"support";
                    break;
                    
                default:
                    break;
            }
            
            
        }else
        {
            switch (indexPath.row) {
                case 0://全部位置
                    
                    break;
                case 1://上单
                     str = @"上单";
                    break;
                case 2://中单
                     str = @"中弹";
                    break;
                case 3://打野
                     str = @"打野";
                    break;
                case 4://ADC
                     str = @"ADC";
                    break;
                    
                default:
                    break;
            }
           
            
        }
        
      
        
        if (str==nil) {
            self.AllHeroArr = self.OldAllHeroArr;
            
        }else
        {
            self.AllHeroArr = [self chooseArrayWithKeyWord:str];
        }
        
        
        [self.allHero reloadData];
        
        
        if(indexPath.leftOrRight==0){
          
            self.currentData1Index = indexPath.row;
            
            return;
        }
        
    } else if(indexPath.column == 1){//价格
        
       
        
        switch (indexPath.row) {
            case 0://价格不限
                
                break;
            case 1://450
                 str = @"450";
                break;
            case 2://1350
                 str = @"1350";
                break;
            case 3://3150
                 str = @"3150";
                break;
            case 4://6300
                 str = @"4800";
                break;
                
            default://7800
                 str = @"7800";
                break;
        }
        
        
     
        if (str==nil) {
            self.AllHeroArr = self.OldAllHeroArr;
            
        }else
        {
            self.AllHeroArr = [self chooseArrayWithKeyWord:str];
        }
        
        
        [self.allHero reloadData];
        
        
        self.currentData2Index = indexPath.row;
        
    } else{
        
        
        switch (indexPath.row) {
            case 0://默认排序
                break;
            case 1://物理
                [self SortedWithType:0];
                break;
            case 2://法伤
                [self SortedWithType:2];
                break;
            case 3://防御
                [self SortedWithType:1];
                break;
            case 4://操作
                [self SortedWithType:3];
                break;
                
            default:
                break;
        }
        

        
        self.currentData3Index = indexPath.row;
    }
    
    
    

    
}

#pragma mark 排序等
//所有英雄数据筛选
- (void)SortedWithType:(int)type{
    
 
    self.AllHeroArr =[ self.OldAllHeroArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        heroBasicData *hero1 = obj1;
        heroBasicData *hero2 = obj2;
        
       NSArray *hero1arr = [hero1.rating componentsSeparatedByString:@","];
        NSArray *hero2arr = [hero2.rating componentsSeparatedByString:@","];
        
        NSComparisonResult  result = [hero1arr[type] compare:hero2arr[type]];
        
       
        
        return result;
    }];

        [self.allHero reloadData];
    
}






//根据关键词 来 选择数组
-(NSArray *)chooseArrayWithKeyWord:(NSString *)keyword
{
    NSMutableArray *new = [NSMutableArray array];
    for (heroBasicData *hero in self.OldAllHeroArr) {
        if ([hero.title containsString:keyword]) {
            [new addObject:hero];
        }
        if ([hero.enName containsString:keyword]) {
            [new addObject:hero];
        }
        if ([hero.cnName containsString:keyword]) {
            [new addObject:hero];
        }
        if ([hero.tags containsString:keyword]) {
            [new addObject:hero];
        }
        if ([hero.rating containsString:keyword]) {
            [new addObject:hero];
        }
        if ([hero.location containsString:keyword]) {
            [new addObject:hero];
        }
        if ([hero.price containsString:keyword]) {
            [new addObject:hero];
        }
       
    }
    
    
    
    
    return new;
    
}



@end
