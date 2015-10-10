//
//  TICollectionViewController.h
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TITaggedPostsCollectionViewDataSource;

@interface TICollectionViewController : UICollectionViewController <UIGestureRecognizerDelegate>

@property (nonatomic, strong) TITaggedPostsCollectionViewDataSource *allPosts;

@end