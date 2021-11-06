//
//  AMBreadCrumbNavController.m
//  MBackupper
//
//  Created by mac on 2021/9/13.
//

#import "AMBreadCrumbNavController.h"
@interface AMBreadCrumbNavController ()<AMBreadCrumbBarDelegate,UIGestureRecognizerDelegate,UINavigationControllerDelegate>
@property(strong,nonatomic) UIViewController* rootViewController;
@property(copy,nonatomic) NavItemSelect block;
@end

@implementation AMBreadCrumbNavController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    //super中已经初始化好导航条了
    if (self = [super initWithRootViewController:rootViewController]) {
        
        //将导航栏设置为不透明
        self.navigationBar.translucent = NO;
        //设置根视图
        self.rootViewController = rootViewController;
        //分类添加一个面包屑导航条,用来覆盖掉系统自带的导航条
        [self breadCrumbNav];
        //初始化根视图控制器导航栏
        self.breadCrumbBar.controllers = @[self.rootViewController];
        //设置面包屑导航代理
        self.breadCrumbBar.delegate = self;
        //隐藏自带导航条
        [self setNavigationBarHidden:YES];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak AMBreadCrumbNavController *weakSelf = self;
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
    
    // Do any additional setup after loading the view.
}


#pragma -mark 控制器栈管理
/// 入栈控制器
- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //关闭侧滑返回
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
        self.interactivePopGestureRecognizer.enabled = NO;
    //先入栈
    [super pushViewController:viewController animated:animated];
    //更新面包屑导航条
    self.breadCrumbBar.controllers = self.viewControllers;
}

#pragma -mark 面包屑点击协议
-(void)clickViewController:(UIViewController *)viewController{
    
    if ([self.viewControllers containsObject:viewController]) {
        
        if ([self.visibleViewController isEqual:viewController]) {
            return;
        }
        [self popToViewController:viewController animated:YES];
       //判断当前ViewControllers栈底元素是否是根视图，因为如果是跨页面跳转，比如A-B-C-D，D-C跳转 self.viewControllers栈底元素是根视图A，但是D-B跳转，self.viewControllers栈底元素却不是根视图A
        if (![self.viewControllers.firstObject isEqual:self.rootViewController]) {
            //删除不是根视图的栈底元素
            [self.viewControllers.firstObject removeFromParentViewController];
        }
        //更新面包屑导航条
        self.breadCrumbBar.controllers = self.viewControllers;
    }
  
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
