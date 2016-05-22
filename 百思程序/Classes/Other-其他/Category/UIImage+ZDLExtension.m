//
//  UIImage+ZDLExtension.m
//  百思程序
//
//  Created by apple on 16/5/22.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "UIImage+ZDLExtension.h"

@implementation UIImage (ZDLExtension)
- (instancetype)circleImage{
    
    UIGraphicsBeginImageContext(self.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextAddEllipseInRect(ctx, rect);
    
    CGContextClip(ctx);
    
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+ (instancetype)circleImageNamed:(NSString *)name{
    return [[self imageNamed:name] circleImage];
}

@end
