//
//  ZDLEssenceViewController.m
//  百思程序
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "ZDLEssenceViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "ZDLTagViewController.h"

@interface ZDLEssenceViewController ()

@end

@implementation ZDLEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    self.view.backgroundColor   = ZDLGlobalBg;
    
}
- (void) tagClick{
    ZDLTagViewController *tag = [[ZDLTagViewController alloc] init];
    [self.navigationController pushViewController:tag animated:YES ];
    
}
@end