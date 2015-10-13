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
#import "TIServicesConstants.h"
#import "TIPresentationConstants.h"

@implementation TICollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.contentInset = UIEdgeInsetsMake(TINavigationBarHeight,0,0,0);
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

@end

