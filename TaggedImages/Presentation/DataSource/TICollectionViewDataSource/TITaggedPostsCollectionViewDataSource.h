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

//#warning методы init всегда с "-", с "+" создаются так называемые фабричные методы, их имя должно быть в стиле taggedPostsCollectionViewDataSourceWith...
+ (TITaggedPostsCollectionViewDataSource *)taggedPostsCollectionViewDataSourceWithTag:(NSString *)tag
                                                                       collectionView:(UICollectionView *)collectionView;

@end
