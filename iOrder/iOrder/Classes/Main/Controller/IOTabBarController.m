//
//  IOTabBarController.m
//  iOrder
//
//  Created by 易无解 on 4/9/16.
//  Copyright © 2016 易无解. All rights reserved.
//

#import "IOTabBarController.h"

#import "IOOrderViewController.h"
#import "IOOrderedViewController.h"
#import "IOProfileViewController.h"
#import "IONavigationController.h"

#import "YWJTabBar.h"

@interface IOTabBarController ()<YWJTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation IOTabBarController

- (NSMutableArray *)items{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

#pragma mark - YWJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加所有的子控制器
    [self setUpAllChildViewController];
    
    //更换系统TabBar里的内容
    [self setUpTabBar];
    
}

//更换系统TabBar里的内容
- (void)setUpTabBar{
    YWJTabBar *tabBar = [[YWJTabBar alloc] initWithFrame:self.tabBar.bounds];
    tabBar.backgroundColor = [UIColor whiteColor];
    
    // 给自定义的tabBar传递tabBarItem模型
    tabBar.items = self.items;
    
    tabBar.delegate = self;
    [self.tabBar addSubview:tabBar];
}

//添加所有的子控制器
- (void)setUpAllChildViewController{
    //点餐
    IOOrderViewController *order = [[IOOrderViewController alloc] init];
    [self setUpOneChildViewController:order image:[UIImage imageNamed:@"1"] selectedImage:[UIImage imageNamed:@"1-"] title:@"点餐"];
    
    //已点菜单
    IOOrderedViewController *ordered = [[IOOrderedViewController alloc] init];
    [self setUpOneChildViewController:ordered image:[UIImage imageNamed:@"2"] selectedImage:[UIImage imageNamed:@"2-"] title:@"已点菜单"];
    
    //我的
    IOProfileViewController *profile = [[IOProfileViewController alloc] init];
    [self setUpOneChildViewController:profile image:[UIImage imageNamed:@"3"] selectedImage:[UIImage imageNamed:@"3-"] title:@"我的"];
}

//添加一个子控制器(用NavigationController包装)
- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title{
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    
    //保存tabBarItem到数组中，通过这个设置按钮的颜色等等
    [self.items addObject:vc.tabBarItem];
    
    IONavigationController *nav = [[IONavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tabBar delegate
- (void)tabBar:(YWJTabBar *)tabBar didClickButton:(NSUInteger)index{
    
    //切换控制器
    self.selectedIndex = index;
}

@end
