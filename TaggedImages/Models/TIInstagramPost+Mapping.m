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
    
    FEMAttribute *attribute =
    [[FEMAttribute alloc] initWithProperty:@"createdTime"
                                   keyPath:@"created_time"
                                       map:^id(id value) {
                                           if ([value isKindOfClass:[NSString class]]) {
                                               NSInteger doubleValue = [value doubleValue];
                                               return [NSDate dateWithTimeIntervalSince1970:doubleValue];
                                           }
                                           return nil;
                                       }
                                reverseMap:^id(id value) {
                                    if ([value isKindOfClass:[NSDate class]]) {
                                        NSTimeInterval dateInterval = ((NSDate *)value).timeIntervalSince1970;
                                        return [NSString stringWithFormat:@"%.0f", dateInterval];
                                    }
                                    return nil;
                                }];
    
    
    [mapping addAttribute:attribute];
    [mapping addAttributesFromDictionary:@{@"captionText": @"caption.text"}];
//    [mapping addAttributesFromDictionary:@{@"createdTime": @"created_time"}];
    [mapping addAttributesFromArray:@[@"id"]];
    return mapping;
}

@end
