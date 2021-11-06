//
//  UIViewController+AMBreadCrumbNav.m
//  MBackupper
//
//  Created by mac on 2021/8/31.
//

#import "UIViewController+AMBreadCrumbNav.h"
#import <Masonry/Masonry.h>
#import <objc/runtime.h>
#define kScreen_Width  [[UIScreen mainScreen] bounds].size.width
#define kScreen_Height [[UIScreen mainScreen] bounds].size.height
#define kIs_iPhoneX kScreen_Width >=375.0f && kScreen_Height >=812.0f
#define kNavBarAndStatusBarHeight (CGFloat)(kIs_iPhoneX?(88.0):(64.0))
@implementation UIViewController (AMBreadCrumbNav)

- (void)setBreadCrumbBar:(AMBreadCrumbNavBar *)breadCrumbBar{
    
    objc_setAssociatedObject(self, @selector(breadCrumbBar), breadCrumbBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (AMBreadCrumbNavBar *)breadCrumbBar{
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBreadCrumbView:(UIView *)breadCrumbView {
    
    objc_setAssociatedObject(self, @selector(breadCrumbView), breadCrumbView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setRightView:(UIView *)rightView{
    objc_setAssociatedObject(self, @selector(rightView), rightView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)rightView{
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void) addRightItem:(UIView*) item {

    //将view添加到右侧拓展视图上面
    if (self.rightView) {
        //调整view样式
        
        [self.rightView addSubview:item];
        //调整view样式
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.top.bottom.mas_equalTo(item.superview);
        }];
    }
}

/// 使用运行时，懒加载一个属性
- (UIView *)breadCrumbView {
    
    UIView* _breadCrumView = objc_getAssociatedObject(self, _cmd);
    
    if (_breadCrumView == nil) {
        _breadCrumView = [[UIView alloc] init];
        _breadCrumView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
        [self.view addSubview:_breadCrumView];
        
       
        self.breadCrumbView = _breadCrumView;
    }
    
    return  objc_getAssociatedObject(self, _cmd);
}

- (void) breadCrumbNav {
    
    //添加一个导航视图
    AMBreadCrumbNavBar* breadCrumbBar = [[AMBreadCrumbNavBar alloc] init];
    [self.breadCrumbView addSubview:breadCrumbBar];
    self.breadCrumbBar = breadCrumbBar;
    breadCrumbBar.backgroundColor = [UIColor orangeColor];
    //添加右侧拓展视图
    UIView* rightView = [[UIView alloc] init];
    [self.breadCrumbView addSubview:rightView];
    self.rightView = rightView;
    
    //布局View
    [self.breadCrumbView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.height.mas_equalTo(@(kNavBarAndStatusBarHeight));
    }];
    
    [breadCrumbBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(breadCrumbBar.superview);
        make.right.mas_equalTo(breadCrumbBar.superview).offset(-10);
        make.left.mas_equalTo(breadCrumbBar.superview).offset(10);
        make.height.mas_equalTo(@44);
    }];

}

@end
