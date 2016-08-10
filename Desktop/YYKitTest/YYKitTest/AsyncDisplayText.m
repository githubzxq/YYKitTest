//
//  AsyncDisplayText.m
//  YYKitTest
//
//  Created by iermu-xiaoqi.zhang on 16/7/29.
//  Copyright © 2016年 iermu-xiaoqi.zhang. All rights reserved.
//

#import "AsyncDisplayText.h"
#import <YYKit.h>

@interface YYTextAsyncExampleCell : UITableViewCell

@property (nonatomic, assign) BOOL async;

- (void)setAyncText:(NSAttributedString *)text;

- (void)setAyncTextLayout:(YYTextLayout *)layout;

@end

@implementation YYTextAsyncExampleCell{
    YYLabel *_yyLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _yyLabel = [YYLabel new];
        _yyLabel.font = [UIFont systemFontOfSize:8];
        _yyLabel.numberOfLines = 0;
        _yyLabel.size = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), 44);
        _yyLabel.displaysAsynchronously = YES;
        [self.contentView addSubview:_yyLabel];
    }
    return self;
}

- (void)setAyncText:(NSAttributedString *)text
{
    _yyLabel.attributedText = text;
}

- (void)setAyncTextLayout:(YYTextLayout *)layout
{
    _yyLabel.textLayout = layout;
}

@end


@interface AsyncDisplayText ()

@property (nonatomic, strong) NSMutableArray *layouts;

@end

@implementation AsyncDisplayText

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource= self;
    [self.tableView registerClass:[YYTextAsyncExampleCell class] forCellReuseIdentifier:@"id"];
    NSMutableArray *strings = [NSMutableArray new];
    self.layouts = [NSMutableArray array];
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.size = CGSizeMake(80, 80);
    indicator.center = CGPointMake(self.view.width / 2, self.view.height / 2);
    indicator.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.670];
    indicator.clipsToBounds = YES;
    indicator.layer.cornerRadius = 6;
    [indicator startAnimating];
    [self.navigationController.view addSubview:indicator];
    
    
    NSMutableArray *layouts = [NSMutableArray array];
    _layouts = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 300; i++) {
            NSString *str = [NSString stringWithFormat:@"%d Async Display Test ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫 Async Display Test ✺◟(∗❛ัᴗ❛ั∗)◞✺ ✺◟(∗❛ัᴗ❛ั∗)◞✺ 😀😖😐😣😡🚖🚌🚋🎊💖💗💛💙🏨🏦🏫",i];
            
            NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:str];
            text.font = [UIFont systemFontOfSize:10];
            text.lineSpacing = 0;
            text.strokeWidth = @(-3);
            text.strokeColor = [UIColor redColor];
            text.lineHeightMultiple = 1;
            text.maximumLineHeight = 12;
            text.minimumLineHeight = 12;
            
            NSShadow *shadow = [NSShadow new];
            shadow.shadowBlurRadius = 1;
            shadow.shadowColor = [UIColor redColor];
            shadow.shadowOffset = CGSizeMake(0, 1);
            [strings addObject:text];
            
            // it better to do layout in background queue...
            YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), 44)];
            YYTextLayout *layout = [YYTextLayout layoutWithContainer:container text:text];
            [layouts addObject:layout];
        }
        self.layouts = layouts;
        dispatch_async(dispatch_get_main_queue(), ^{
            [indicator removeFromSuperview];
            [self.tableView reloadData];
        });
    });
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _layouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYTextAsyncExampleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
    [cell setAyncTextLayout:_layouts[indexPath.row]];
    return cell;
}


@end
