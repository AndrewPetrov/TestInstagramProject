//
//  TITableVCDataSource.h
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TIDataSource.h"
@class UITableView;

@interface TITableViewDataSource : TIDataSource

@property (nonatomic, strong) UITableView *tableView;

@end
