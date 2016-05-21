//
//  ZDLTabBar.m
//  百思程序
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "ZDLTabBar.h"
@interface ZDLTabBar()
@property (nonatomic,weak)UIButton *publishButton;
@end

@implementation ZDLTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"]forState:UIControlStateHighlighted];
        publishButton.size = publishButton.currentBackgroundImage.size;
        [self addSubview:publishButton];
        self.publishButton = publishButton;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.width;
    CGFloat height = self.height;
    self.publishButton.center = CGPointMake(width * 0.5, height * 0.5);
    CGFloat buttonY = 0;
    CGFloat buttonW = width/5;
    CGFloat buttonH = height;
    NSInteger index = 0;
    for (UIView *button in self.subviews) {
        if (![button isKindOfClass:[UIControl class]] || button == self.publishButton) continue;
        CGFloat buttonX = buttonW * ((index > 1)?(index + 1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        index++;
    }
}
@end
