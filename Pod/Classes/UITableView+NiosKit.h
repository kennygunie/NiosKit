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

- (NSMutableArray *)dataSourceWithItems:(NSArray *)items;

@end
