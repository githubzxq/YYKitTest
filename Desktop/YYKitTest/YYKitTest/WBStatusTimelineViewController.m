//
//  WBStatusTimelineViewController.m
//  YYKitTest
//
//  Created by iermu-xiaoqi.zhang on 16/8/9.
//  Copyright © 2016年 iermu-xiaoqi.zhang. All rights reserved.
//

#import "WBStatusTimelineViewController.h"
#import "WBStatusLayout.h"
#import "WBStatusCell.h"
#import "WBStatus.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface WBStatusTimelineViewController ()

@property (nonatomic, strong) NSMutableArray *layouts;

@end

@implementation WBStatusTimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[WBStatusCell class] forCellReuseIdentifier:cellIdentifier];
    
    self.layouts = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (NSUInteger i = 0; i < 10; i++) {
            WBStatus *status = [[WBStatus alloc] init];
            WBStatusLayout *layout = [[WBStatusLayout alloc] initWithStatus:status];
            //                [layout layout];
            [_layouts addObject:layout];
        }
    });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WBStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[WBStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell setLayout:];
    return cell;
}



@end
