//
//  TITableViewController.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TITableViewController.h"
#import "TITableViewCell.h"
#import "TITableViewDataSource.h"
#import "TIPresentationConstants.h"

@interface TITableViewController ()



@end

@implementation TITableViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
}
//
//- (NSInteger)postCount;
//- (TIInstagramPost *)instagramPostAtIndex:(NSInteger)index;
//- (NSInteger)tagsCount;
//- (NSArray *)instagramPosts;
//


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.allPosts postCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:TITableViewCellIdentifier
                                    forIndexPath:indexPath];
    [cell setPost:[self.allPosts postAtIndex:indexPath.row]];
    return cell;
}

@end

