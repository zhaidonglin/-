//
//  UIBarButtonItem+ZDLExtension.m
//  百思程序
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "UIBarButtonItem+ZDLExtension.h"

@implementation UIBarButtonItem (ZDLExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
    
}
@end
