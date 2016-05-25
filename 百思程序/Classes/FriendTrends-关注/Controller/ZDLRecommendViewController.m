//
//  ZDLRecommendViewController.m
//  百思程序
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "ZDLRecommendViewController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "ZDLRecommendUserCell.h"
#import "ZDLRecommendCategoryCell.h"
#import "ZDLRecommendCategory.h"

@interface ZDLRecommendViewController ()<UITableViewDataSource,UITableViewDelegate>;
@property(nonatomic,assign) NSArray *categories;
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@end

@implementation ZDLRecommendViewController

static NSString *const ZDLCategoryId = @"category";
//static NSString *const ZDLUserId = @"user";
//注册

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.categoryTableView registerNib:[UINib nibWithNibName:([ZDLRecommendCategoryCell class]) bundle:nil] forCellReuseIdentifier:ZDLCategoryId];
    
    self.title = @"推荐关注";
    self.view.backgroundColor = ZDLGlobalBg;
   
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"categoary";
    params[@"c"] = @"subscribe";
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        ZDLLog(@"%@", responseObject);

        [SVProgressHUD dismiss];
        
        self.categories = [ZDLRecommendCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.categoryTableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败"];
        
//        ZDLLog(@"%@",error);
    }];

}
#pragma 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.categories.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZDLRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:ZDLCategoryId];
    cell.category = self.categories[indexPath.row];
    return  cell;
    
}
@end
