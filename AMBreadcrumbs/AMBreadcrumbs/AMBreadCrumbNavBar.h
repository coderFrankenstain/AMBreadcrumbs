//
//  AMBreadcrumbNavView.h
//  MBackupper
//
//  Created by mac on 2021/8/26.
//

#import <UIKit/UIKit.h>
#import "NSArray+BreadcrumbNav.h"

@protocol AMBreadCrumbBarDelegate <NSObject>

- (void) clickViewController:(UIViewController  *   _Nonnull ) viewController;

@end
NS_ASSUME_NONNULL_BEGIN

@interface AMBreadCrumbNavBar : UIView
/// 保存系统导航控制器入栈的控制器
@property(strong,nonatomic) NSArray<UIViewController*>* controllers;
@property(weak,nonatomic) id<AMBreadCrumbBarDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
