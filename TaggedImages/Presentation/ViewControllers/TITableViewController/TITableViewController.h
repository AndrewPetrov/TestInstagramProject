//
//  TITableViewController.h
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TITaggedPostsDataSource.h"
@class TITaggedPostsTableViewDataSource;

@interface TITableViewController : UITableViewController <TITaggedPostsDataSourceProtocol>

@property (nonatomic, strong) TITaggedPostsTableViewDataSource *allPosts;

- (void)dataSourceIsUpdated;

@end
