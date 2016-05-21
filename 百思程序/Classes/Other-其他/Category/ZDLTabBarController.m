//
//  ZDLTabBarController.m
//  百思程序
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "ZDLTabBarController.h"
#import "ZDLEssenceViewController.h"
#import "ZDLNavigationController.h"
#import "ZDLFriendTrendsViewController.h"
#import "ZDLMeViewController.h"
#import "ZDLNewViewControllew.h"
#import "ZDLTabBar.h"

@implementation ZDLTabBarController

+(void)initialize{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor  darkGrayColor];
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildVc:[[ZDLEssenceViewController alloc] init] title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
     [self setupChildVc:[[ZDLNewViewControllew alloc] init] title:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
     [self setupChildVc:[[ZDLFriendTrendsViewController alloc] init] title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
     [self setupChildVc:[[ZDLMeViewController alloc] init] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    [self setValue:[[ZDLTabBar alloc] init] forKeyPath:@"tabBar"];
    
}
-(void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    vc.navigationController.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    ZDLNavigationController *nav = [[ZDLNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
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
