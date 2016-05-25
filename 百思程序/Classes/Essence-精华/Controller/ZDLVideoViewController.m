//
//  ZDLVideoViewController.m
//  百思程序
//
//  Created by apple on 16/5/23.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "ZDLVideoViewController.h"
#import "ZDLTopic.h"
@interface ZDLVideoViewController ()

@end

@implementation ZDLVideoViewController
- (ZDLTopicType)type
{
    return ZDLTopicTypeVideo;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
