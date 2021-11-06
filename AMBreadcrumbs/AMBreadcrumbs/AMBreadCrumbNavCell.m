//
//  AMBreadcrumbNavCell.m
//  MBackupper
//
//  Created by mac on 2021/8/31.
//

#import "AMBreadCrumbNavCell.h"
#import <Masonry/Masonry.h>

@interface AMBreadCrumbNavCell()
@end


@implementation AMBreadCrumbNavCell

/// 设置导航字体
+ (UIFont *)titleFont {
    return [UIFont systemFontOfSize:12];
}

///使用运行时给分类添加一个懒加载属性
- (UILabel *)titleLabel {
    
    //尝试根据(cmd) 当前方法名，获取titleLabel，如果获取不到新建一个UILable返回
    
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor =  [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        _titleLabel.font = [AMBreadCrumbNavCell titleFont];
        //设置关联属性
    }
    return  _titleLabel;
}

- (UIView *)accessoryView{
    if (_accessoryView == nil) {
        _accessoryView = [[UIView alloc] init];
    }
    return _accessoryView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //添加view
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.accessoryView];
        
        
        //开始布局
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(self.titleLabel.superview);
            make.right.mas_equalTo(self.accessoryView.mas_left).offset(-10);
        }];
        
        [self.accessoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel.mas_right).offset(10);
            make.size.mas_equalTo(CGSizeMake(20, self.frame.size.height));
            
        }];
    }
    return self;
}

- (void)setController:(UIViewController *)controller{
    _controller = controller;
    NSLog(@"标题是 %@",controller.navigationItem.title);
    self.titleLabel.text = controller.navigationItem.title;
}
@end
