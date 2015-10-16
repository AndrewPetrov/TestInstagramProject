
//  TITableViewController.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TITableViewController.h"
#import "TITableViewCell.h"
#import "TITaggedPostsTableViewDataSource.h"
#import "TIPresentationConstants.h"
#import "TIServicesConstants.h"

@implementation TITableViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(TINavigationBarHeight,0,0,0);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.taggedPostsDataSource.postCount < TITaggedPostsPageSize) {
        [self.taggedPostsDataSource requestRecentPost];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.taggedPostsDataSource postCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:TITableViewCellIdentifier
                                    forIndexPath:indexPath];
    [cell setPost:[self.taggedPostsDataSource postAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.taggedPostsDataSource.postCount - TIPostsCountLoadingHandicap) {
        [self.taggedPostsDataSource requestRecentPost];
    }
}

@end
