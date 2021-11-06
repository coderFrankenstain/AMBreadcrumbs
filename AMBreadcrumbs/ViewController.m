//
//  ViewController.m
//  AMBreadcrumbs
//
//  Created by coderjun on 2021/11/6.
//

#import "ViewController.h"
#import "AMBreadCrumbNavController.h"
#import "BreadcrumbViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"面包屑导航";
//    
    BreadcrumbViewController* rootVc = [[BreadcrumbViewController alloc] init];
    rootVc.navigationItem.title = @"根视图";
    AMBreadCrumbNavController* breadCrumb = [[AMBreadCrumbNavController alloc] initWithRootViewController:rootVc];
    [self addChildViewController:breadCrumb];
    [self.view addSubview:breadCrumb.view];
}


@end
