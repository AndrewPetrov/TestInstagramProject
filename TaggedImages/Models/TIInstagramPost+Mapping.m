//
//  TIInstagramPost+Mapping.m
//  TaggedImages
//
//  Created by Андрей on 10/1/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TIInstagramPost+Mapping.h"
#import <FastEasyMapping.h>

@implementation TIInstagramPost (Mapping)

+ (FEMMapping *)defaultMapping {
    FEMMapping *mapping = [[FEMMapping alloc] initWithEntityName:@"TIInstagramPost"];
    [mapping addAttributesFromDictionary:@{@"pictureURL": @"images.standard_resolution.url"}];
    [mapping addAttributesFromDictionary:@{@"captionText": @"caption.text"}];
    [mapping addAttributesFromDictionary:@{@"createdTime": @"created_time"}];
    [mapping addAttributesFromArray:@[@"id"]];
    return mapping;
}

@end
