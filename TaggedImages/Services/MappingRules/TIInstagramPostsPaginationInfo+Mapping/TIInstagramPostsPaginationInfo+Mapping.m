//
//  TIInstagramPostsPaginationIDs+Mapping.m
//  TaggedImages
//
//  Created by Андрей on 10/11/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TIInstagramPostsPaginationInfo+Mapping.h"
#import <FastEasyMapping.h>

@implementation TIInstagramPostsPaginationInfo (Mapping)

+ (FEMMapping *)defaultMapping {
    FEMMapping *mapping = [[FEMMapping alloc] initWithObjectClass:[TIInstagramPostsPaginationInfo class]];
    
    [mapping addAttributesFromDictionary:@{@"nextMaxTagId": @"next_max_tag_id"}];
    [mapping addAttributesFromDictionary:@{@"minTagId": @"min_tag_id"}];
    [mapping addAttributesFromDictionary:@{@"nextUrl": @"next_url"}];
    return mapping;
}

@end
