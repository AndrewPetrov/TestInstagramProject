//
//  TITableVCDataSource.h
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TIITaggedPostsDataSource.h"
@class UITableView;

@interface TITaggedPostsTableViewDataSource : TIITaggedPostsDataSource
//TODO: move to .m
@property (nonatomic, strong) UITableView *tableView;

+ (TITaggedPostsTableViewDataSource *)initWithTag:(NSString *)tag tableView:(UITableView *)tableView;

@end
