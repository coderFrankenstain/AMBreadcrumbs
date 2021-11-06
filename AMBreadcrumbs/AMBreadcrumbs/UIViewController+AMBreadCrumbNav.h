//
//  UIViewController+AMBreadCrumbNav.h
//  MBackupper
//
//  Created by mac on 2021/8/31.
//

#import <UIKit/UIKit.h>
#import "AMBreadCrumbNavBar.h"
NS_ASSUME_NONNULL_BEGIN

/// 给控制器添加一个面包屑导航栏
@interface UIViewController (AMBreadCrumbNav)

/// 面包屑导航栏整个导航栏视图
@property(strong,nonatomic) UIView* breadCrumbView;

/// 面包屑功能条
@property(strong,nonatomic) AMBreadCrumbNavBar* breadCrumbBar;

/// 右侧拓展视图
@property(strong,nonatomic) UIView* rightView;

/// 给右侧拓展视图添加自定义控件
/// @param item 右侧控件
- (void) addRightItem:(UIView*) item;

///// 右侧拓展按钮
//@property(strong,nonatomic) UIButton* selectButton;

- (void) breadCrumbNav;
@end

NS_ASSUME_NONNULL_END
