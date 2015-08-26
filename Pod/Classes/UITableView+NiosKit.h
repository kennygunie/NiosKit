//
//  UITableView+NiosKit.h
//  Pods
//
//  Created by Kien NGUYEN on 26/08/2015.
//
//

#import <UIKit/UIKit.h>
@class NKShowHideItem;

@interface UITableView (NiosKit)

- (void)removeItem:(NKShowHideItem *)item inDataSource:(NSMutableArray *)dataSource forSection:(NSInteger)section;

- (void)addItem:(NKShowHideItem *)item withParentIndex:(NSInteger)parentIndex inDataSource:(NSMutableArray *)dataSource forSection:(NSInteger)section;

- (NSMutableArray *)dataSourceWithItems:(NSArray *)items;

@end
