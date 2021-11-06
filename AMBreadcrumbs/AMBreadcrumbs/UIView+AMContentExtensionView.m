//
//  UIView+AMContentExtensionView.m
//  MBackupper
//
//  Created by mac on 2021/8/26.
//

#import "UIView+AMContentExtensionView.h"
#import <objc/runtime.h>
#import <Masonry.h>

@implementation UIView (AMContentExtensionView)

- (void)setContentLabel:(UILabel *)contentLabel{
    
    objc_setAssociatedObject(self, @selector(contentLabel), contentLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (UILabel *)contentLabel {
    UILabel* _contentLabel = objc_getAssociatedObject(self, _cmd);
    
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        [self addSubview:_contentLabel];
        self.contentLabel = _contentLabel;
        
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
    }
    
    return _contentLabel;
}


@end
