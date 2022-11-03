//
//  MineViewController.m
//  iOS_ThemeForOC
//
//  Created by mryel on 2022/10/17.
//

#import "MineViewController.h"
#import "SetingViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.text = @"点击一下去设置皮肤";
    tipLabel.numberOfLines = 0;
    tipLabel.textColor = UIColor.blackColor;
    [self.view addSubview:tipLabel];
    tipLabel.theme_backGroundColor = ThemeColor_AppMainColor_Exam;

    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(110, 200, 100, 100)];
    imgV.theme_image = @"icon_type_0";
    imgV.center = CGPointMake(self.view.center.x, 200);
    [self.view addSubview:imgV];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.navigationController pushViewController:SetingViewController.new animated:NO];
}
@end
