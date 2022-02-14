//
//  SettingTableViewController.m
//  ThemeTestDemo
//
//  Created by JXH on 2022/1/25.
//  Copyright © 2022 JXH. All rights reserved.
//

#import "SettingTableViewController.h"

#import "XHThemeService.h"
#import "ThemeColorKey.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface SettingTableViewController ()
/** 数据源*/
@property (nonatomic, copy) NSArray *dataA;
@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"肤色测试";
    
    /** 配置视图*/
    [self configSubViews];
    /** 加载数据*/
    [self loadData];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"随机" style:UIBarButtonItemStylePlain target:self action:@selector(rigBarAction)];
    
}
/** 配置视图*/
- (void)configSubViews {
    //TableView
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"SettingTableViewControllerCell"];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = UIColor.whiteColor;
    //换肤项
    NSArray *itemA = @[
    @{@"title":@"文字颜色0",@"type":@"0",@"value":ThemeColor_Text_Color_Default_333333_0},
    @{@"title":@"文字颜色1",@"type":@"0",@"value":ThemeColor_Text_Color_Default_333333_1},
    @{@"title":@"图片",@"type":@"2",@"value":@"skin_icon_0"},
    @{@"title":@"图片",@"type":@"2",@"value":@"assets_icon_1"},
    @{@"title":@"背景色1",@"type":@"1",@"value":ThemeColor_Color_Default_FFFFFF_0},
    ];
    UIView *headerView = [self loadDataViewWithDataA:itemA];
    headerView.theme_backGroundColor = ThemeColor_AppMainColor;
    self.tableView.tableHeaderView = headerView;
    
}
- (UIView *)loadDataViewWithDataA:(NSArray *)array {
    UIView *contentV = [UIView new];
    NSInteger count = array.count;
    CGFloat itemH = 30;
    contentV.frame = CGRectMake(0, 0, kScreenW, itemH *count);
    
    for (int i = 0; i < count; i ++) {
        //info
        NSDictionary *configD = array[i];
        NSString *title = configD[@"title"];
        NSInteger type = [configD[@"type"] integerValue];
        NSString *value = configD[@"value"];
        
        UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        itemBtn.frame = CGRectMake(0, itemH * i, kScreenW, itemH);
        [itemBtn setTitle:title forState:UIControlStateNormal];
        itemBtn.backgroundColor = UIColor.whiteColor;
        [itemBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        itemBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        itemBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        switch (type) {
            case 0://文字颜色
            {
                [itemBtn setTheme_TitleColor:value forState:UIControlStateNormal];

            }
                break;
            case 1://背景色
            {
                itemBtn.theme_backGroundColor = value;

            }
                break;
            case 2://图片
            {
                [itemBtn setTheme_Image:value forState:UIControlStateNormal];
            }
                break;
                
            default:
                break;
        }
        [contentV addSubview:itemBtn];
    }
    
    return contentV;
}
/** 加载数据*/
- (void)loadData {
    self.dataA = [XHThemeService getThemeInfoModelArray];
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataA.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingTableViewControllerCell" forIndexPath:indexPath];
    
    XHThemeInfoModel *infoModel = self.dataA[indexPath.row];
    cell.textLabel.text = [infoModel.name stringByAppendingFormat:@"_type:%@",infoModel.type];
    cell.textLabel.textColor = UIColor.blackColor;
    cell.contentView.backgroundColor = UIColor.whiteColor;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    XHThemeInfoModel *infoModel = self.dataA[indexPath.row];
    //换肤
    [XHThemeService changeSkinWithSkinType:infoModel.type.integerValue];
    
    
}
- (void)rigBarAction {
    NSInteger type = arc4random()%(self.dataA.count+1);
    NSInteger curType = [XHThemeService getCurrentThemeType];
    if (curType != type) {
        //换肤
        [XHThemeService changeSkinWithSkinType:type];
    }else {
        [self rigBarAction];
    }
}

@end
