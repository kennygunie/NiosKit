//
//  NKShowHideItem.m
//  Pods
//
//  Created by Kien Nguyen on 26/08/15.
//
//

#import "NKShowHideItem.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "NSArray+NiosKit.h"

@interface NKShowHideItem ()

#pragma mark - Private Properties
@property (nonatomic, readwrite) BOOL show;
@property (nonatomic, readwrite) NKShowHideItem *parent;
@end

@implementation NKShowHideItem

#pragma mark - Setup & Teardown

+ (NKShowHideItem *)cellItemWithID:(NSInteger)itemID
                              show:(BOOL)show {
    NKShowHideItem *cellItem = [NKShowHideItem new];
    cellItem.show = show;
    cellItem.itemID = itemID;
    return cellItem;
}

#pragma mark - Superclass Overrides

-(void)setOpen:(BOOL)open {
    if (open) {
        // Show
        NSMutableArray *shownItems = [NSMutableArray new];
        for (NKShowHideItem *child in self.children) {
            if (child.parent == self) {
                if (!child.show) {
                    [shownItems addObject:child];
                }
                child.show = YES;
            }
        }
        if (self.didShowItems) {
            self.didShowItems([shownItems reversedArray]);
        }
    }
    else {
        // Hide
        for (NKShowHideItem *child in self.children) {
            child.show = NO;
            child.open = NO;
        }
    }
    _open = open;
}

- (void)setShow:(BOOL)show {
    _show = show;
    if (!_show && self.didHideItem) {
        self.didHideItem();
    }
}

- (void)setChildren:(NSArray *)children {
    _children = children;
    for (NKShowHideItem *child in _children) {
        child.parent = self;
    }
}


@end
