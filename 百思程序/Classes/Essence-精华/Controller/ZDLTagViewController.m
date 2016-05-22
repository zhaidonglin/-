//
//  ZDLTagViewController.m
//  百思程序
//
//  Created by apple on 16/5/22.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "ZDLTagViewController.h"
#import "ZDLTagCellTableViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "ZDLTag.h"
#import <MJExtension/MJExtension.h>

@interface ZDLTagViewController ()

@property(nonatomic, strong) NSArray *tags;

@property(nonatomic, weak) AFHTTPSessionManager *manager;

@end

@implementation ZDLTagViewController
static NSString *const ZDLTagCell = @"tag";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title = @"推荐标签";
    
    [self setupTable];
    
    [self loadTag];
    
    
    
   
}
- (void)setupTable{
    self.tableView.rowHeight = 70;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZDLTagCellTableViewCell class]) bundle:nil] forCellReuseIdentifier:ZDLTagCell];
    
}

- (void)loadTag{
    [SVProgressHUD show];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
    __weak typeof(self) weakSelf = self;
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil
     
              success:^(NSURLSessionDataTask *task, id responseObject) {
                  
                  if (responseObject == nil) {
                      [SVProgressHUD showErrorWithStatus:@"加载标签数据失败"];
                      return;
                  }
                  
                  weakSelf.tags = [ZDLTag mj_objectArrayWithKeyValuesArray:responseObject];
                  
                  [weakSelf.tableView reloadData];
    }
     
              failure:^(NSURLSessionDataTask *task, NSError *error) {
                  
        if (error.code == NSURLErrorCancelled) return;
                  
        if (error.code == NSURLErrorCancelled) {
            [SVProgressHUD showErrorWithStatus:@"加载超时，稍后再试"];
        }else{
            [SVProgressHUD showErrorWithStatus:@"加载数据失败"];
        }
    }];
    
    

}
- (void)dealloc{
    [self.manager invalidateSessionCancelingTasks:YES];
    [SVProgressHUD dismiss];
    
}




#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tags.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZDLTagCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ZDLTagCell];
    
    cell.tagModel = self.tags[indexPath.row];


    return cell;
}



@end
