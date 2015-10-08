//
//  TICollectionViewController.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TICollectionViewController.h"
#import "TICollectionViewCell.h"
#import "TICollectionViewDataSource.h"
#import "TIPresentationConstants.h"

@interface TICollectionViewController ()

@property (nonatomic, strong) IBOutlet TICollectionViewDataSource *allPosts;

@end

@implementation TICollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    //#warning рекогнайзер стоит создавать в сториборде
}

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded) {
        return;
    }
    CGPoint p = [gestureRecognizer locationInView:self.collectionView];
    
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:p];
    if (indexPath == nil){
        NSLog(@"couldn't find index path");
    }
    else {
        //TODO: delete id from FRC
    }
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

@end
