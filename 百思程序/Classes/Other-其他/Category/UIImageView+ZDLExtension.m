//
//  UIImageView+ZDLExtension.m
//  百思程序
//
//  Created by apple on 16/5/22.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "UIImageView+ZDLExtension.h"
#import <SDWebImage/UIImageView+WebCache.h>


@implementation UIImageView (ZDLExtension)
- (void)setHeadeer:(NSString *)url{
    [self setCircleHeader:url];
    
}
- (void)setRectHeader:(NSString *)url{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}
- (void)setCircleHeader:(NSString *)url{
    
    __weak typeof(self) weakSelf = self;
    
    UIImage *placeholder = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image == nil) return;
        
        weakSelf.image = [image circleImage];
    }];
}
@end
