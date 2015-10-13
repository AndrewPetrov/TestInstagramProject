//
//  TICollectionViewController.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TICollectionViewController.h"
#import "TICollectionViewCell.h"
#import "TITaggedPostsCollectionViewDataSource.h"
#import "TIPresentationConstants.h"

@implementation TICollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.allPosts postCount];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TICollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:TICollectionViewCellIdentifier
                                              forIndexPath:indexPath];
    [cell setPost:[self.allPosts postAtIndex:indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.allPosts.postCount - TIPostsCountLoadingHandicap) {
        [self.allPosts requestRecentPost];
    }
}

#pragma mark - TITaggedPostsDataSourceProtoco

- (void)dataSourceIsUpdated {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.allPosts.postCount - TITaggedPostsPageSize) inSection:0];
    [self.collectionView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom  animated:YES];
}

@end

