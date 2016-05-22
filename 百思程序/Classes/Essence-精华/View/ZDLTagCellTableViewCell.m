//
//  ZDLTagCellTableViewCell.m
//  百思程序
//
//  Created by apple on 16/5/22.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "ZDLTagCellTableViewCell.h"
#import "ZDLTag.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface ZDLTagCellTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageListView;

@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;

@end

@implementation ZDLTagCellTableViewCell

- (void)setFrame:(CGRect)frame{
    
    
    [super setFrame:frame];
}
- (void)setTagModel:(ZDLTag *)tagModel{
    
    _tagModel = tagModel;
    
    [self.imageListView setHeadeer:tagModel.image_list];
    
    self.themeNameLabel.text = tagModel.theme_name;
    
    
    
    if (tagModel.sub_number >= 10000) {
        self.subNumberLabel.text = [NSString stringWithFormat:@"%.1f万人订阅",tagModel.sub_number/10000.0];
        
    }else{
        self.subNumberLabel.text = [NSString stringWithFormat:@"%zd人订阅", tagModel.sub_number];
    }
    
}
@end
