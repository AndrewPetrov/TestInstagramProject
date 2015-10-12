//
//  NSFetchedResultsController+Factory.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "NSFetchedResultsController+Factory.h"
#import "TIInstagramPost.h"
//#import "TIInstagramTag.h"

#import <MagicalRecord.h>

@implementation NSFetchedResultsController (Factory)

+ (NSFetchedResultsController *)instagramPostsFRCWithTag:(NSString *)tag {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tag = %@", tag];
    return [TIInstagramPost MR_fetchAllGroupedBy:nil
                                   withPredicate:predicate
                                        sortedBy:@"createdTime"
                                       ascending:NO];
}

@end