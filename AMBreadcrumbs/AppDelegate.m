//
//  AppDelegate.m
//  AMBreadcrumbs
//
//  Created by coderjun on 2021/11/6.
//

#import "AppDelegate.h"
#import "AMBreadCrumbNavController.h"
#import "TestViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    TestViewController* rootVc = [[TestViewController alloc] init];
    rootVc.navigationItem.title = @"是我根视图";
    AMBreadCrumbNavController* breadCrumb = [[AMBreadCrumbNavController alloc] initWithRootViewController:rootVc];
    [self setRootViewController:breadCrumb];
    return YES;
}

- (void) setRootViewController:(UIViewController*) rootViewController {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:rootViewController];
    [self.window makeKeyAndVisible];
}
@end
