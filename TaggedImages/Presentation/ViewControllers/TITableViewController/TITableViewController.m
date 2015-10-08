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

@interface TITableViewController ()

@property (nonatomic, strong) IBOutlet TITableViewDataSource *allPosts;

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
    NSString *TITableViewCellIdentifier = @"TITableViewCellIdentifier";
    TITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:TITableViewCellIdentifier
                                    forIndexPath:indexPath];
    [cell setPost:[self.allPosts instagramPosts][indexPath.row]];

    return cell;
}

@end

