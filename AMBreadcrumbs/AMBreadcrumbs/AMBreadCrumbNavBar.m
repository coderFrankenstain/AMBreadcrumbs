//
//  AMBreadcrumbNavView.m
//  MBackupper
//
//  Created by mac on 2021/8/26.
//

#import "AMBreadCrumbNavBar.h"
#import "NSArray+BreadcrumbNav.h"
#import "UIView+AMContentExtensionView.h"
#import "AMBreadCrumbNavCell.h"
#import <Masonry/Masonry.h>
@interface AMBreadCrumbNavBar()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(strong,nonatomic) UICollectionView* collectionView;
@end

@implementation AMBreadCrumbNavBar

//初始化
- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (instancetype) init {
    
    if (self = [super init]) {
        //默认向右滑动
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        [collectionView registerClass:[AMBreadCrumbNavCell class] forCellWithReuseIdentifier:NSStringFromClass([self class])];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.bounces = NO;
        self.collectionView = collectionView;
        [self addSubview:collectionView];
        
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        
        collectionView.backgroundColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];;
    }
    return self;
}

- (void)setControllers:(NSArray<UIViewController *> *)controllers{
    _controllers = controllers;
    [self.collectionView reloadData];
    //如果导航条无法展示所有cell，则将collectionView自动滑动到末尾。
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:controllers.count-1 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

#pragma collectionView delegate
- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //点击事件
    [self.controllers objectAtIndex:indexPath.row block:^(BOOL showAccessory, UIViewController* controller) {
        ///协议回调点击控制器
        if ([self.delegate respondsToSelector:@selector(clickViewController:)]) {
            [self.delegate clickViewController:controller];
        }
    }];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.controllers.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    AMBreadCrumbNavCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
    cell.tag = indexPath.row;
    [self.controllers objectAtIndex:indexPath.row block:^(BOOL showAccessory, UIViewController* controller) {
        
        [cell setController:controller];
        cell.accessoryView.contentLabel.text = showAccessory ? @"":@">";
    }];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    __block NSDictionary *attribute = @{NSFontAttributeName:[AMBreadCrumbNavCell titleFont]};
    __block CGSize currentLabelSize;
    
    [self.controllers objectAtIndex:indexPath.row block:^(BOOL showAccessory, UIViewController* controller) {
        currentLabelSize = [controller.navigationItem.title sizeWithAttributes:attribute];
        currentLabelSize.width = showAccessory ? currentLabelSize.width : currentLabelSize.width+30;
    }];
  
    return CGSizeMake(currentLabelSize.width, self.frame.size.height);
}

///添加高亮状态
//- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
//
//}
//- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor clearColor];
//}
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    return YES;
//}

@end
