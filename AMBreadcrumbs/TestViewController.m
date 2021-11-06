//
//  TestViewController.m
//  AMBreadcrumbs
//
//  Created by coderjun on 2021/11/6.
//

#import "TestViewController.h"
#define ColorWithAlpha(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RandomColor ColorWithAlpha(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256),1)

@interface TestViewController ()

@end

@implementation TestViewController
{
    NSString* root;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RandomColor;
 
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    [button setTitle:@"点击切换页面" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    button.center = self.view.center;
    [self.view addSubview:button];
    
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(button.frame.origin.x, CGRectGetMaxY(button.frame)+30, 200, 30)];
    titleLabel.font = [UIFont systemFontOfSize:14.0f];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = self.navigationItem.title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    // Do any additional setup after loading the view.
}



- (void) pushAction {
    int page =rand() % 1000;
    NSString* name = [NSString stringWithFormat:@"我是随机视图 %d",page];
    TestViewController* test = [[TestViewController alloc] init];
    test.navigationItem.title = name;
    [self.navigationController pushViewController:test animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
