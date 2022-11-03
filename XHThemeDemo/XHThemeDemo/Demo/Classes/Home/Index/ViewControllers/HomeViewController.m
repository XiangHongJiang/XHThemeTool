//
//  HomeViewController.m
//  iOS_ThemeForOC
//
//  Created by mryel on 2022/10/17.
//

#import "HomeViewController.h"
#import "DetailViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.text = @"点击一下去详情";
    tipLabel.numberOfLines = 0;
    tipLabel.textColor = UIColor.blackColor;
    [self.view addSubview:tipLabel];
    
    tipLabel.theme_backGroundColor = ThemeColor_AppMainColor_Exam;
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.navigationController pushViewController:DetailViewController.new animated:NO];
}

@end
