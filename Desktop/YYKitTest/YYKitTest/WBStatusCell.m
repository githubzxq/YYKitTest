//
//  WBStatusCell.m
//  YYKitTest
//
//  Created by iermu-xiaoqi.zhang on 16/8/9.
//  Copyright © 2016年 iermu-xiaoqi.zhang. All rights reserved.
//

#import "WBStatusCell.h"


@implementation WBStatusProfileView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

@end



@implementation WBStatusView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.profileView];
        [self addSubview:self.textLabel];
    }
    return self;
}

@end


@implementation WBStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.statusView];
    }
    return self;
}

- (void)setLayout:(WBStatusLayout *)layout {
    _statusView.layout = layout;
}

@end
