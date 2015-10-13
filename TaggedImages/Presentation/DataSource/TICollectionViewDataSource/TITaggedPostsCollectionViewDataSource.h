//
//  TICollectionViewDataSource.h
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TITaggedPostsDataSource.h"

@class UICollectionView;
@class NSString;

@interface TITaggedPostsCollectionViewDataSource : TITaggedPostsDataSource

+ (TITaggedPostsCollectionViewDataSource *)initWithTag:(NSString *)tag collectionView:(UICollectionView *)collectionView;

@end
