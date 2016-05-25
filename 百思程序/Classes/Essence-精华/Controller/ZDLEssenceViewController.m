//
//  ZDLEssenceViewController.m
//  百思程序
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "ZDLEssenceViewController.h"
//#import <AFNetworking/AFNetworking.h>
#import "ZDLTagViewController.h"
#import "ZDLTopicViewController.h"
#import "ZDLAllViewController.h"
#import "ZDLVideoViewController.h"
#import "ZDLVoiceViewController.h"
#import "ZDLPictureViewController.h"
#import "ZDLWordViewController.h"
#import "ZDLTitleButton.h"


@interface ZDLEssenceViewController ()

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, weak) UIView *titlesView;

@property (nonatomic, strong) NSMutableArray *titleButtons;

@property (nonatomic, weak) UIView *titleBottomView;

@property (nonatomic, weak) ZDLTitleButton *selectedTitleButton;

@end

@implementation ZDLEssenceViewController

- (NSMutableArray *)titleButtons{
    if (!_titleButtons) {
        
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;

}

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    [self setupNav];
    [self setupChildVC];
    
    
    
    
    UIView *titlesView = [[UIView alloc] init];
    
    titlesView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    
    titlesView.frame = CGRectMake(0, 64, self.view.width, 35);
    
    [self.view addSubview:titlesView];
    
    self.titlesView = titlesView;
    
    
    NSUInteger count = self.childViewControllers.count;

    CGFloat titleButtonH = titlesView.height;
    
    CGFloat titleButtonW = titlesView.width / count;
    
    for (int i = 0; i < count; i++) {
        
        ZDLTitleButton *titleButton = [ZDLTitleButton buttonWithType:UIButtonTypeCustom];
        
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [titlesView addSubview:titleButton];
        
        [self.titleButtons addObject:titleButton];
        
        
        NSString *title = [self.childViewControllers[i] title];
    
        
        [titleButton setTitle:title forState:UIControlStateNormal];
        [titleButton layoutIfNeeded];

        
        titleButton.y = 0;
        titleButton.height = titleButtonH;
        titleButton.tag = i;
        
        titleButton.width =  titleButtonW;
        titleButton.x = i * titleButton.width;
    }
    
        UIView *titleBottomView = [[UIView alloc] init];
        //    titleBottomView.backgroundColor = [self.titleButtons.lastObject titleColorForState:UIControlStateSelected];
        titleBottomView.backgroundColor = [UIColor redColor];
        
        titleBottomView.height = 1;
        
        titleBottomView.y = titlesView.height - titleBottomView.height;
        
        [titlesView addSubview:titleBottomView];
        
        self.titleBottomView = titleBottomView;
        

    
        ZDLTitleButton *firstTitleButton = self.titleButtons.firstObject;
        
        [firstTitleButton.titleLabel sizeToFit];
        
        titleBottomView.width = firstTitleButton.titleLabel.width;
    
        
        titleBottomView.centerX = firstTitleButton.centerX;
    
        
        [self titleClick:firstTitleButton];
    
        ZDLLog(@"%@", NSStringFromCGRect(titleBottomView.frame));
    
    
  
 
    
   
    
}

-(void)setupChildVC
{
    ZDLAllViewController *all = [[ZDLAllViewController alloc] init];
    all.title = @"全部";
    [self addChildViewController:all];
    ZDLVideoViewController *Video = [[ZDLVideoViewController alloc] init];
    Video.title = @"视频";
    [self addChildViewController:Video];
    ZDLVoiceViewController *Voice = [[ZDLVoiceViewController alloc] init];
    Voice.title = @"声音";
    [self addChildViewController:Voice];
    ZDLPictureViewController *picture = [[ZDLPictureViewController alloc] init];
    picture.title = @"图片";
    [self addChildViewController:picture];
    ZDLWordViewController *word = [[ZDLWordViewController alloc] init];
    word.title = @"段子";
    [self addChildViewController:word];
    
}
#pragma 监听

- (void)titleClick:(ZDLTitleButton *)titleButton{
    
    self.selectedTitleButton.selected = NO;
    
    titleButton.selected = YES;
    
    self.selectedTitleButton = titleButton;

    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.titleBottomView.width = titleButton.titleLabel.width;
        
        self.titleBottomView.centerX = titleButton.centerX;
        }];
    
    
//    CGPoint offset = self.scrollView.contentOffset;
//    offset.x = self.view.width
    
    
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