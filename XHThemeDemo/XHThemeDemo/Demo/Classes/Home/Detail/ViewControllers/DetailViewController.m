//
//  DetailViewController.m
//  iOS_ThemeForOC
//
//  Created by mryel on 2022/10/17.
//

#import "DetailViewController.h"
#import "SetingViewController.h"

@interface DetailViewController ()
/** 提示label*/
@property (nonatomic, strong) UILabel *tipLabel;
@end

@implementation DetailViewController
#pragma mark - -------------- lazy load -----------------
- (UILabel *)tipLabel {
    if(_tipLabel == nil){
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.font = [UIFont systemFontOfSize:25];
        _tipLabel.numberOfLines = 0;
        _tipLabel.textColor = UIColor.blackColor;
    }
    return _tipLabel;
}
#pragma mark - -------------- life cycle -----------------
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情页";
    
    [self configSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configData];
}
#pragma mark - -------------- setup ui -----------------
- (void)configSubViews {
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Seting" style:UIBarButtonItemStylePlain target:self action:@selector(setingClick)];

    self.tableView.tableHeaderView  = self.tipLabel;
}

#pragma mark - -------------- config -----------------
- (void)configData {
    //用这个
    NSString *className = [XHThemeManager sharedThemeManager].themeConfigName;
    NSInteger type = [XHThemeManager sharedThemeManager].currentThemeType;
    NSString *themeInfoStr = nil;
    if(className.length){
        themeInfoStr = [NSString stringWithFormat:@"当前主题\n%@:%ld",className,type];
    }else{
        themeInfoStr = @"当前主题";
    }
    //或者用这个吧
    XHThemeItemModel *themeInfo = [XHThemeManager getCurrentThemeItemInfoModel];
    if(themeInfo){
        themeInfoStr = [themeInfoStr stringByAppendingFormat:@"\n%@",themeInfo.name];
    }
    
    self.tipLabel.text = themeInfoStr;
}
#pragma mark - -------------- network -----------------

#pragma mark - -------------- action -----------------
- (void)setingClick {
    [self.navigationController pushViewController:SetingViewController.new animated:NO];
}
#pragma mark - -------------- tableview dataSource -----------------

#pragma mark - -------------- tableView delegate -----------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
