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
#import "ZDLTopicViewController.h"
#import "ZDLAllViewController.h"
#import "ZDLVideoViewController.h"
#import "ZDLVoiceViewController.h"
#import "ZDLPictureViewController.h"
#import "ZDLWordViewController.h"


@interface ZDLEssenceViewController ()

@property (nonatomic, weak) UIView *titlesView;

@property (nonatomic, strong) NSMutableArray *titleButtons;

@end

@implementation ZDLEssenceViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    [self setupNav];
    
    ZDLAllViewController *all = [[ZDLAllViewController alloc] init];
    all.title = @"全部";
    [self addChildViewController:all];
    ZDLVideoViewController *Video = [[ZDLVideoViewController alloc] init];
    all.title = @"视频";
    [self addChildViewController:Video];
    ZDLVoiceViewController *Voice = [[ZDLVoiceViewController alloc] init];
    all.title = @"声音";
    [self addChildViewController:Voice];
    ZDLPictureViewController *picture = [[ZDLPictureViewController alloc] init];
    all.title = @"图片";
    [self addChildViewController:picture];
    ZDLWordViewController *word = [[ZDLWordViewController alloc] init];
    all.title = @"段子";
    [self addChildViewController:word];
    
    
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    
    titlesView.frame = CGRectMake(0, 64, self.view.width, 35);
    
    [self.view addSubview:titlesView];
    
    _titlesView = titlesView;
    NSUInteger count = self.childViewControllers.count;
    
    CGFloat titleButtonH = titlesView.height;
    
    CGFloat titleButtonW = titlesView.width / count;
    for (int i = 0; i < count; i++) {
        
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [titlesView addSubview:titleButton];
        
        NSString *title = [self.childViewControllers[i] title];
        
        [titleButton setTitle:title forState:UIControlStateNormal];
        
        titleButton.y = 0;
        titleButton.height = titleButtonH;
        
        titleButton.width =  titleButtonW;
        titleButton.x = i * titleButton.width;
        
    }
    
    
    
}
- (void) tagClick{
    ZDLTagViewController *tag = [[ZDLTagViewController alloc] init];
    [self.navigationController pushViewController:tag animated:YES ];
    
}

- (void)setupNav{
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(tagClick)];
    self.view.backgroundColor   = ZDLGlobalBg;

}
@end