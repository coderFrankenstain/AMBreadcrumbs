//
//  BreadcrumbViewController.m
//  AMBreadcrumbs
//
//  Created by coderjun on 2021/11/6.
//

#import "BreadcrumbViewController.h"
#import "TestViewController.h"
@interface BreadcrumbViewController ()

@end

@implementation BreadcrumbViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}

- (void) action {
    TestViewController* pushController = [[TestViewController alloc] init];
    pushController.navigationItem.title = @"test";
    [self.navigationController pushViewController:pushController animated:YES];
    
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
