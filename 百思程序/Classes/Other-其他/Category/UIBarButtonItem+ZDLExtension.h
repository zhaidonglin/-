//
//  UIBarButtonItem+ZDLExtension.h
//  百思程序
//
//  Created by apple on 16/5/4.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZDLExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
