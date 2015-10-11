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
//TODO: move to .m
@property (nonatomic, strong) UITableView *tableView;

+ (TITaggedPostsTableViewDataSource *)initWithTag:(NSString *)tag tableView:(UITableView *)tableView;

@end
