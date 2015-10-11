//
//  TIInstagramPostsPaginationIDs+Mapping.m
//  TaggedImages
//
//  Created by Андрей on 10/11/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TIInstagramPostsPaginationIDs+Mapping.h"
#import <FastEasyMapping.h>

@implementation TIInstagramPostsPaginationIDs (Mapping)

+ (FEMMapping *)defaultMapping {
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:[TIInstagramPostsPaginationIDs class]];
    [mapping addAttributesFromArray:@[@"next_max_tag_id", @"min_tag_id", @"next_url"]];
    return mapping;
}

@end