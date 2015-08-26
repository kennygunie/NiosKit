//
//  NKShowHideItem.h
//  Pods
//
//  Created by Kien Nguyen on 26/08/15.
//
//

#import <Foundation/Foundation.h>

@interface NKShowHideItem : NSObject

#pragma mark - Properties

/**
 *  Item ID
 */
@property (nonatomic) NSInteger itemID;
/**
 *  Getter of parrent item
 */
@property (nonatomic, readonly) NKShowHideItem *parent;
/**
 *  Children can be a NKShowHideItem or an array of NKShowHideItem
 */
@property (nonatomic) id children;
/**
 *  Define if item should be shown or hidden
 */
@property (nonatomic, readonly, getter=isShow) BOOL show;
/**
 *  Define if item is open
 */
@property (nonatomic, getter=isOpen) BOOL open;

/**
 *  Completion when items are shown
 *  @param shown items
 */
@property (nonatomic, copy) void (^didShowItems)(NSArray *);
/**
 *  Completion when a (single) item is hidden
 */
@property (nonatomic, copy) void (^didHideItem)();

#pragma mark - Class Methods

+ (NKShowHideItem *)cellItemWithID:(NSInteger)itemID
                              show:(BOOL)show;

@end
