//
//  ZDLMeViewController.m
//  百思程序
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "ZDLMeViewController.h"

@implementation ZDLMeViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"我";
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
    self.view.backgroundColor = ZDLGlobalBg;

}
- (void)settingClick
{
    ZDLLogFunc;
}

- (void)moonClick
{
    ZDLLogFunc;
}
@end
