//
//  UITableView+NiosKit.m
//  Pods
//
//  Created by Kien NGUYEN on 26/08/2015.
//
//

#import "UITableView+NiosKit.h"
#import "NKShowHideItem.h"

@implementation UITableView (NiosKit)

- (void)removeItem:(NKShowHideItem *)item inDataSource:(NSMutableArray *)dataSource forSection:(NSInteger)section {
    NSUInteger index = [dataSource[section] indexOfObject:item];
    if (index != NSNotFound) {
        [dataSource[section] removeObject:item];
        [self beginUpdates];
        [self deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:section]]
                    withRowAnimation:UITableViewRowAnimationBottom];
        [self endUpdates];
    }
}

- (void)addItem:(NKShowHideItem *)item withParentIndex:(NSInteger)parentIndex inDataSource:(NSMutableArray *)dataSource forSection:(NSInteger)section {
    if (parentIndex != NSNotFound) {
        [dataSource[section] insertObject:item atIndex:parentIndex + 1];
        [self beginUpdates];
        [self insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:parentIndex + 1 inSection:section]]
                    withRowAnimation:UITableViewRowAnimationBottom];
        [self endUpdates];
    }
    
}

- (NSMutableArray *)dataSourceWithItems:(NSArray *)items {
    NSMutableArray *dataSource = [NSMutableArray new];
    for (NSInteger section = 0; section < [items count]; section++) {
        [dataSource addObject:[NSMutableArray new]];
        for (NKShowHideItem *item in items[section]) {
            if (item.isShow) {
                [dataSource[section] addObject:item];
            }
            __weak typeof(item) weakItem = item;
            
            [item setDidShowItems:^(NSArray *shownItems) {
                for (NKShowHideItem *shownItem in shownItems) {
                    [self addItem:shownItem
                  withParentIndex:[dataSource[section] indexOfObject:weakItem]
                     inDataSource:dataSource
                       forSection:section];
                }
            }];
            
            [item setDidHideItem:^{
                [self removeItem:weakItem inDataSource:dataSource forSection:section];
            }];
        }
    }
    return dataSource;
}


@end
