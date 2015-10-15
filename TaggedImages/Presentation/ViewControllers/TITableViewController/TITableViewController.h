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

//#warning плохое имя для датасорса
@property (nonatomic, strong) TITaggedPostsTableViewDataSource *taggedPostsDataSource;

@end
