//
//  AMBreadCrumbNavController.h
//  MBackupper
//
//  Created by mac on 2021/9/13.
//

#import <UIKit/UIKit.h>
#import "UIViewController+AMBreadCrumbNav.h"
typedef void(^NavItemSelect)(BOOL isSelect);
NS_ASSUME_NONNULL_BEGIN

@interface AMBreadCrumbNavController : UINavigationController

@end

NS_ASSUME_NONNULL_END
