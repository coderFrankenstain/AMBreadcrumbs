//
//  NSArray+BreadcrumbNav.m
//  MBackupper
//
//  Created by mac on 2021/8/26.
//

#import "NSArray+BreadcrumbNav.h"
@implementation NSArray (BreadcrumbNav)

- (void) objectAtIndex:(NSInteger) index block:(showBlock) block {
    
    id object = [self objectAtIndex:index];
    
    if (self.count == 1 || index == self.count-1) {
        block(YES,object);
    }
    else {
        block(NO,object);
        
    }
}


@end
