//
//  TIDataSource.h
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@class TIInstagramPost;
@class TIInstagramPostsPaginationIDs;

@interface TITaggedPostsDataSource : NSObject <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) TIInstagramPostsPaginationIDs *postsPaginationIDs;

- (NSInteger)postCount;
- (TIInstagramPost *)postAtIndex:(NSInteger)index;
- (NSInteger)tagsCount;
- (NSArray *)instagramPosts;
- (void)requestRecentPost;

@end
