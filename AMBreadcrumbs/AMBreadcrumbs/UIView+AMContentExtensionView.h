//
//  UIView+AMContentExtensionView.h
//  MBackupper
//
//  Created by mac on 2021/8/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AMContentExtensionView)

/// 在当前View上添加一个contentLabel ，默认大小为当前视图的大小
@property(strong,nonatomic) UILabel* contentLabel;
@end

NS_ASSUME_NONNULL_END
