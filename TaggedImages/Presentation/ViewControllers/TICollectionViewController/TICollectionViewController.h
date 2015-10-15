//
//  TICollectionViewController.h
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <UIKit/UIKit.h>
//#warning зачем здесь этот импорт?
@class TITaggedPostsCollectionViewDataSource;

@interface TICollectionViewController : UICollectionViewController

//#warning плохое имя для датасорса
@property (nonatomic, strong) TITaggedPostsCollectionViewDataSource *taggedPostsDataSource;

@end