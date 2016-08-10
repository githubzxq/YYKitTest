//
//  WBStatusLayout.h
//  YYKitTest
//
//  Created by iermu-xiaoqi.zhang on 16/8/9.
//  Copyright © 2016年 iermu-xiaoqi.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYKit/YYKit.h>
#import "WBStatus.h"

@interface WBStatusLayout : NSObject

- (instancetype)initWithStatus:(WBStatus *)status;

//个人资料
@property (nonatomic, assign) CGFloat profileHeight;//个人总资料高度
@property (nonatomic, strong) YYTextLayout *nameTextLayout;//名字
@property (nonatomic, strong) YYTextLayout *sourceTextLayout;//时间/来源

//文本
@property (nonatomic, assign) CGFloat textHeight;//文本高度
@property (nonatomic, strong) YYTextLayout *textLayout;//文本
@property (nonatomic, assign) CGFloat textPictureHeight;//文本图片高度

@end
