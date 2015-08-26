//
//  NKShowHideTableViewController.m
//  NiosKit
//
//  Created by Kien NGUYEN on 26/08/2015.
//  Copyright (c) 2015 Kien Nguyen. All rights reserved.
//

#import "NKShowHideTableViewController.h"

typedef NS_ENUM(NSInteger, NKShowHideTableViewControllerCellID) {
    NKShowHideTableViewControllerCellID0, // section 1
    NKShowHideTableViewControllerCellID1,
    NKShowHideTableViewControllerCellID2,
    NKShowHideTableViewControllerCellID3,
    NKShowHideTableViewControllerCellID4,
    NKShowHideTableViewControllerCellID5,
    NKShowHideTableViewControllerCellID6, // section 2
    NKShowHideTableViewControllerCellID7,
    NKShowHideTableViewControllerCellID8,
    NKShowHideTableViewControllerCellID9
};


@interface NKShowHideTableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSArray *dataSource;
@property (nonatomic) NSArray *section1;
@property (nonatomic) NSArray *section2;

@end

@implementation NKShowHideTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.dataSource = [self.tableView dataSourceWithItems:@[self.section1,
                                                            self.section2]];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup data source
-(NSArray *)section1 {
    if (!_section1) {
        NSArray *section = @[
                             [NKShowHideItem cellItemWithID:NKShowHideTableViewControllerCellID0 show:YES],
                             [NKShowHideItem cellItemWithID:NKShowHideTableViewControllerCellID1 show:YES],
                             [NKShowHideItem cellItemWithID:NKShowHideTableViewControllerCellID2 show:YES],
                             [NKShowHideItem cellItemWithID:NKShowHideTableViewControllerCellID3 show:NO],
                             [NKShowHideItem cellItemWithID:NKShowHideTableViewControllerCellID4 show:NO],
                             [NKShowHideItem cellItemWithID:NKShowHideTableViewControllerCellID5 show:NO]
                             ];
        
        NKShowHideItem *item2 = section[2];
        item2.children = @[section[3],section[4],section[5]];
        NKShowHideItem *item4 = section[4];
        item4.children = @[section[5]];
        
        _section1 = section;
    }
    
    return _section1;
}

- (NSArray *)section2 {
    if (!_section2) {
        NSArray *section = @[
                             [NKShowHideItem cellItemWithID:NKShowHideTableViewControllerCellID6 show:YES],
                             [NKShowHideItem cellItemWithID:NKShowHideTableViewControllerCellID7 show:YES],
                             [NKShowHideItem cellItemWithID:NKShowHideTableViewControllerCellID8 show:NO],
                             [NKShowHideItem cellItemWithID:NKShowHideTableViewControllerCellID9 show:YES]
                             ];
        
        NKShowHideItem *item = section[1];
        item.children = @[section[2]];
        
        _section2 = section;
    }
    return _section2;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NKShowHideItem *item = self.dataSource[indexPath.section][indexPath.row];
    item.open = !item.isOpen;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataSource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NKShowHideTableViewCell" forIndexPath:indexPath];
    NKShowHideItem *item = self.dataSource[indexPath.section][indexPath.row];
    if (item.children) {
        cell.backgroundColor = [UIColor yellowColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%li", item.itemID];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.dataSource[indexPath.section] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NKShowHideItem *item  = self.dataSource[fromIndexPath.section][fromIndexPath.row];
    [self.dataSource[fromIndexPath.section] removeObjectAtIndex:fromIndexPath.row];
    [self.dataSource[toIndexPath.section] insertObject:item atIndex:toIndexPath.row];
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
