//
//  YWJNavigationController.m
//  iOrder
//
//  Created by 易无解 on 3/30/16.
//  Copyright © 2016 易无解. All rights reserved.
//

#import "YWJNavigationController.h"

@interface YWJNavigationController ()<UINavigationControllerDelegate>

@end

@implementation YWJNavigationController

#pragma mark - YWJNavigationController

+ (void)initialize{
    // 获取当前类下面的UIBarButtonItem
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [item setTitleTextAttributes:titleAttr forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    设置代理
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation Controller
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    获取主窗口的rootViewController, 即tabBarController
    UITabBarController *tabBarC = (UITabBarController *)YWJKeyWindow.rootViewController;
    
//    移除系统的tabBarButton
    for (UIView *tabBarButton in tabBarC.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton removeFromSuperview];
        }
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
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
