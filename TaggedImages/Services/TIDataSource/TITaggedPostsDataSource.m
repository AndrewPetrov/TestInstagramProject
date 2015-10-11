//
//  TIDataSource.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TITaggedPostsDataSource.h"
#import <MagicalRecord.h>
#import "NSFetchedResultsController+Factory.h"
#import "TIInstagramManager.h"
#import "TIInstagramPostsPaginationIDs.h"
#import "TIInstagramMapingManager.h"

@interface TITaggedPostsDataSource ()

@property (nonatomic, strong) NSMutableArray *instagramPosts;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation TITaggedPostsDataSource

- (NSInteger)postCount {
    return [self.fetchedResultsController fetchedObjects].count;
    
}
- (TIInstagramPost *)postAtIndex:(NSInteger)index {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    return [self.fetchedResultsController objectAtIndexPath:indexPath];
}
- (NSInteger)tagsCount {
    return 0;
}
- (NSArray *)instagramPosts {
    return [self.fetchedResultsController fetchedObjects];
}

- (NSFetchedResultsController *)fetchedResultsController {
    if (!_fetchedResultsController) {
        _fetchedResultsController = [NSFetchedResultsController postsFRC];
        _fetchedResultsController.delegate = self;
        [_fetchedResultsController performFetch:nil];
    }
    return _fetchedResultsController;
}

- (void)requestRecentPost {
    TICompletionBlock completionBlock = ^(NSDictionary* results, NSError *error) {
        self.postsPaginationIDs = [TIInstagramMapingManager mapPaginationIDsFromJSON:results];
    };
    
    [TIInstagramManager requestRecentPostWithTag:self.tag
                                     withNextUrl:self.postsPaginationIDs.next_url
                             withComplitionBlock:completionBlock];
}

@end