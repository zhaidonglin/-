//
//  ZDLFriendTrendsViewController.m
//  百思程序
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "ZDLFriendTrendsViewController.h"
#import "ZDLRecommendViewController.h"
@interface ZDLFriendTrendsViewController()

@end
@implementation ZDLFriendTrendsViewController
 - (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"关注";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"frendsRecommentIcon-click" target:self action:@selector(frendsClick)];
    self.view.backgroundColor = ZDLGlobalBg;
    
    
    
}
- (void)frendsClick{
    ZDLRecommendViewController *vc = [[ZDLRecommendViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];

}
@end
