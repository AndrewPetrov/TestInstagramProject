//
//  TITableViewController.h
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TITaggedPostsTableViewDataSource;

@interface TITableViewController : UITableViewController

@property (nonatomic, strong) TITaggedPostsTableViewDataSource *allPosts;

@end
