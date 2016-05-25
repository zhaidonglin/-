//
//  ZDLTitleButton.m
//  百思程序
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "ZDLTitleButton.h"

@implementation ZDLTitleButton


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted { }


@end
