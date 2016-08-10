//
//  WBStatusCell.h
//  YYKitTest
//
//  Created by iermu-xiaoqi.zhang on 16/8/9.
//  Copyright © 2016年 iermu-xiaoqi.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYKit/YYKit.h>
#import "WBStatusLayout.h"

@interface WBStatusProfileView : UIView

@property (nonatomic, strong) YYLabel *nameLabel;
@property (nonatomic, strong) YYLabel *sourceLabel;

@end

@interface WBStatusView : UIView

@property (nonatomic, strong) WBStatusProfileView *profileView;
@property (nonatomic, strong) YYLabel *textLabel;
@property (nonatomic, strong) WBStatusLayout *layout;

@end

@interface WBStatusCell : UITableViewCell

@property (nonatomic, strong) WBStatusView *statusView;

- (void)setLayout:(WBStatusLayout *)layout;

@end
