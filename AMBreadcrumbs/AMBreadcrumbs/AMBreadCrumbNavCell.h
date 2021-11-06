//
//  AMBreadcrumbNavCell.h
//  MBackupper
//
//  Created by mac on 2021/8/31.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface AMBreadCrumbNavCell : UICollectionViewCell

@property(strong,nonatomic) UILabel* titleLabel;
@property(strong,nonatomic) UIView* accessoryView;
@property(strong,nonatomic) UIViewController* controller;

+ (UIFont *)titleFont;
@end

NS_ASSUME_NONNULL_END
