//
//  WBStatusLayout.m
//  YYKitTest
//
//  Created by iermu-xiaoqi.zhang on 16/8/9.
//  Copyright © 2016年 iermu-xiaoqi.zhang. All rights reserved.
//

#import "WBStatusLayout.h"


@interface WBStatusLayout ()

@property (nonatomic, strong) WBStatus *status;

@end

@implementation WBStatusLayout

- (instancetype)initWithStatus:(WBStatus *)status {
    if (!status) {
        return nil;
    }
    self = [super self];
    _status = status;
    [self layout];
    
    return self;
}

- (void)layout {
    
    [self layoutProfile];
    [self layoutText];
    
}

- (void)layoutProfile {
    
    [self layoutProfileName];
    [self layoutProfileSource];
    _profileHeight += _nameTextLayout.textBoundingSize.height;
    _profileHeight +=_sourceTextLayout.textBoundingSize.height;
}

- (void)layoutProfileName {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:_status.profileName];
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(kScreenSize.width - 100, 999)];
    YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:container text:text];
    _nameTextLayout = textLayout;
}

- (void)layoutProfileSource {
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:_status.profileSource];
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(kScreenSize.width - 100, 999)];
    YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:container text:text];
    _sourceTextLayout = textLayout;
}

- (void)layoutText {

    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:_status.text];
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(kScreenSize.width - 100, 999)];
    YYTextLayout *textLayout = [YYTextLayout layoutWithContainer:container text:text];
    _textLayout = textLayout;
    _textHeight += _textLayout.textBoundingSize.height;
}

@end
