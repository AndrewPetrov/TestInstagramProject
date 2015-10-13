//
//  TITableVCDataSource.h
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TITaggedPostsDataSource.h"

@class UITableView;

@interface TITaggedPostsTableViewDataSource : TITaggedPostsDataSource

+ (TITaggedPostsTableViewDataSource *)initWithTag:(NSString *)tag tableView:(UITableView *)tableView;

@end
