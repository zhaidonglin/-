//
//  ZDLTopicViewController.m
//  百思程序
//
//  Created by apple on 16/5/23.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "ZDLTopicViewController.h"
#import "ZDLTopic.h"
#import "ZDLTopicCell.h"

@interface ZDLTopicViewController ()

@end

@implementation ZDLTopicViewController

static NSString * const ZDLTopicCellId = @"topic";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = ZDLGlobalBg;
    
    self.tableView.contentInset = UIEdgeInsetsMake(ZDLNavBarMaxY + ZDLTitlesViewH, 0, ZDLTabBarH, 0);
    
//    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
//    
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZDLTopicCell class]) bundle:nil] forCellReuseIdentifier:ZDLTopicCellId];
    
    
    
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
@end
