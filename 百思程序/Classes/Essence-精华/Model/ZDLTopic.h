//
//  ZDLTopic.h
//  百思程序
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 MLM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDLTopic : NSObject
typedef enum {
    ZDLTopicTypeAll = 1,
    
    ZDLTopicTypePicture = 10,
    
    ZDLTopicTypeWord = 29,
    
    ZDLTopicTypeVoice = 31,
    
    ZDLTopicTypeVideo = 41
    
} ZDLTopicType;
@end
