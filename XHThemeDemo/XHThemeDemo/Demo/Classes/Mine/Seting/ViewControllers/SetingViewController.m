//
//  SetingViewController.m
//  iOS_ThemeForOC
//
//  Created by mryel on 2022/10/17.
//

#import "SetingViewController.h"
#import "XHThemeService.h"

@interface SetingViewController ()
/** 数据源*/
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation SetingViewController
#pragma mark - -------------- life cycle -----------------
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    //初始化页面
    [self configSubViews];
    //初始化数据
    [self configData];
    
    [self.tableView reloadData];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - -------------- setup ui -----------------
- (void)configSubViews {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

#pragma mark - -------------- config -----------------
- (void)configData {
    
    //模拟下载主题数据
    [XHThemeService downLoadThemeZipFile];
    //显示所有支持的皮肤
    self.dataArray = [XHThemeService getLocalThemeClassInfoArray];
    
}
#pragma mark - -------------- network -----------------

#pragma mark - -------------- action -----------------

#pragma mark - -------------- tableview dataSource -----------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger listCount = self.dataArray.count;
    ThemeClassInfoModel *itemClass = listCount > section? self.dataArray[section]:nil;
    return itemClass.themeInfoModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    ThemeClassInfoModel *itemM = self.dataArray[indexPath.section];
    XHThemeItemModel *item = itemM.themeInfoModelArray[indexPath.row];

    cell.textLabel.text = item.name;
    cell.textLabel.font = [UIFont systemFontOfSize:15.f];
    cell.textLabel.theme_textColor = ThemeColor_Text_Color_Default_Exam;
    cell.imageView.theme_image = indexPath.row % 2? @"icon_type_0":@"icon_type_1";
    cell.theme_backGroundColor = ThemeColor_AppMainColor_Exam;
    
    return cell;
}
#pragma mark - -------------- tableView delegate -----------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //获取数据
    ThemeClassInfoModel *itemM = self.dataArray[indexPath.section];
    XHThemeItemModel *item = itemM.themeInfoModelArray[indexPath.row];
    //更新主题+皮肤类型
    [XHThemeManager updateThemeWithThemeFile:itemM.fileName andThemeType:item.type.integerValue];
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    ThemeClassInfoModel *themeM = self.dataArray[section];
    label.text = themeM.title;
    return label;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
@end
