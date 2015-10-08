//
//  NSFetchedResultsController+Factory.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "NSFetchedResultsController+Factory.h"
#import "TIInstagramPost.h"
#import <MagicalRecord.h>

@implementation NSFetchedResultsController (Factory)

+ (NSFetchedResultsController *)postsFRC {
    return [TIInstagramPost MR_fetchAllGroupedBy:nil withPredicate:nil sortedBy:@"createdTime" ascending:NO];
}
+ (NSFetchedResultsController *)tagsFRC {
    return nil;
}

@end
