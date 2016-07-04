//
//  HeroShowHubView.h
//  LOLHeroShow
//
//  Created by tarenayj on 16/6/26.
//  Copyright © 2016年 TR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSDropDownMenu.h"


@interface HeroShowHubView : UIViewController

//菜单相关

@property(nonatomic,strong) NSMutableArray *data1;
@property(nonatomic,strong) NSMutableArray *data2;
@property(nonatomic,strong) NSMutableArray *data3;

@property(nonatomic,assign) NSInteger currentData1Index;
@property(nonatomic,assign) NSInteger currentData2Index;
@property(nonatomic,assign) NSInteger currentData3Index;

@property(nonatomic,assign) NSInteger currentData1SelectedIndex;
@property(nonatomic,strong) JSDropDownMenu *menu;






@end
