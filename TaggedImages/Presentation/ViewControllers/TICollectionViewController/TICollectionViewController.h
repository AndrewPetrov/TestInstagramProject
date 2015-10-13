//
//  TICollectionViewController.h
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TITaggedPostsDataSource.h"
@class TITaggedPostsCollectionViewDataSource;

@interface TICollectionViewController : UICollectionViewController<TITaggedPostsDataSourceProtocol>

@property (nonatomic, strong) TITaggedPostsCollectionViewDataSource *allPosts;

- (void)dataSourceIsUpdated;

@end