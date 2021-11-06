//
//  NSArray+BreadcrumbNav.h
//  MBackupper
//
//  Created by mac on 2021/8/26.
//

#import <Foundation/Foundation.h>
@class UIViewController;
typedef  void (^showBlock)(BOOL showAccessory,UIViewController* _Nullable controller);

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (BreadcrumbNav)
- (void) objectAtIndex:(NSInteger) index block:(showBlock) block;
@end

NS_ASSUME_NONNULL_END
