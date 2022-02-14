//
//  HomeTableViewController.m
//  ThemeTestDemo
//
//  Created by JXH on 2022/1/25.
//  Copyright © 2022 JXH. All rights reserved.
//

#import "HomeTableViewController.h"
#import "XHThemeService.h"
#import <UIKit/UIKit.h>

@interface HomeTableViewController ()
/** 数据源*/
@property (nonatomic, copy) NSArray *dataA;
/** 当前皮肤信息*/
@property (nonatomic, strong) UILabel *currentThemeInfoLabel;
@end

@implementation HomeTableViewController
- (UILabel *)currentThemeInfoLabel {
    if (_currentThemeInfoLabel == nil) {
        _currentThemeInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 200)];
        _currentThemeInfoLabel.textColor = [UIColor blackColor];
        _currentThemeInfoLabel.font = [UIFont systemFontOfSize:16];
        _currentThemeInfoLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _currentThemeInfoLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self configAndLoadData];
    
    
}
- (void)configAndLoadData {
    self.title = @"首页";
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"HomeTableViewControllerCell"];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.dataA = @[
        @{@"title":@"系统皮肤:XHThemeInfo.plist",@"value":@""},
        @{@"title":@"主题皮肤0:ThemeInfo.plist",@"value":@"ThemeInfo.plist"},
        @{@"title":@"主题皮肤1:ThemeInfo1.plist",@"value":@"ThemeInfo1.plist"},
    ];
    

    self.tableView.tableHeaderView = self.currentThemeInfoLabel;
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showCurrentThemeInfo];
}
- (void)showCurrentThemeInfo {
    NSString *msg = @"当前皮肤类型:";
    if ([XHThemeService getThemeInfoName].length) {
        NSInteger type = [XHThemeService getCurrentThemeType];
        msg = [msg stringByAppendingString:@(type).stringValue];
    }
    self.currentThemeInfoLabel.text = msg;
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataA.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewControllerCell" forIndexPath:indexPath];
    
    NSDictionary *infoModel = self.dataA[indexPath.row];
    cell.textLabel.text = infoModel[@"title"];
    cell.textLabel.textColor = UIColor.blackColor;
    cell.contentView.backgroundColor = UIColor.whiteColor;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *infoModel = self.dataA[indexPath.row];
    if (indexPath.row) {
        //启用皮肤
        [XHThemeService startThemeWithThemeInfo:infoModel[@"value"] withLog:NO];
    }else {
        //启用皮肤
        [XHThemeService startThemeWithThemeInfo:infoModel[@"value"] withLog:YES];
    }
    
    //跳转显示
    Class cls = NSClassFromString(@"SettingTableViewController");
    [self.navigationController pushViewController:[cls new] animated:NO];
}


@end
