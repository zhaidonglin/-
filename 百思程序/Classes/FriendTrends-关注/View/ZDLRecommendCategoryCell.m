//
//  ZDLRecommendCategoryCell.m
//  百思程序
//
//  Created by apple on 16/5/7.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import "ZDLRecommendCategoryCell.h"
#import "ZDLRecommendCategory.h"

@implementation ZDLRecommendCategoryCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setCategory:(ZDLRecommendCategory *)category{
    _category = category;
    self.textLabel.text = category.name;
    
}

@end
