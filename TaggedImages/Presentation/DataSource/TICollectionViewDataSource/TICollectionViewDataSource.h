//
//  TICollectionViewDataSource.h
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TIDataSource.h"
@class UICollectionView;

@interface TICollectionViewDataSource : TIDataSource

@property (nonatomic, strong) UICollectionView *collectionView;

@end
