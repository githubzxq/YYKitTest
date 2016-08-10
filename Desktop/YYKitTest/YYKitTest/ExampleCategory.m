//
//  ExampleCategory.m
//  YYKitTest
//
//  Created by iermu-xiaoqi.zhang on 16/7/29.
//  Copyright © 2016年 iermu-xiaoqi.zhang. All rights reserved.
//

#import "ExampleCategory.h"
#import "AsyncDisplayText.h"
#import "WBStatusTimelineViewController.h"

@interface ExampleCategory ()

@property (nonatomic, strong) NSArray *exampleArr;

@end

@implementation ExampleCategory

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.exampleArr = @[@"Async display text", @"Weibo"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _exampleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"cellIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.textLabel.text = _exampleArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        AsyncDisplayText *vc = [[AsyncDisplayText alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        WBStatusTimelineViewController *vc = [[WBStatusTimelineViewController alloc] initWithStyle:UITableViewStylePlain];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
