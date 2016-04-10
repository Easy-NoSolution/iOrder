//
//  YWJRootTool.m
//  iOrder
//
//  Created by 易无解 on 4/9/16.
//  Copyright © 2016 易无解. All rights reserved.
//

#import "YWJRootTool.h"

#import "IOTabBarController.h"

@implementation YWJRootTool

#pragma mark - self
+ (void)chooseRootViewController:(UIWindow *)window{
    window.rootViewController = [[IOTabBarController alloc] init];
}

@end
