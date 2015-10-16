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

+ (FEMMapping *)defaultMappingWithRequestedTag:(NSString *)requestedTag {
    FEMMapping *mapping = [[FEMMapping alloc] initWithEntityName:@"TIInstagramPost"];
    mapping.primaryKey = @"identifier";
    
    [mapping addAttributesFromDictionary:@{@"pictureURL": @"images.standard_resolution.url"}];
    
    FEMAttribute *attribute =
    [[FEMAttribute alloc] initWithProperty:@"createdTime"
                                   keyPath:@"created_time"
                                       map:^id(id value) {
                                           if ([value isKindOfClass:[NSString class]]) {
                                               return [NSDate dateWithTimeIntervalSince1970:[value doubleValue]];
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
    
//#warning не совсем понял плясок вокруг параметра tag
//    таким образом я оставляю только тот tag по которому делался запрос, наверное правильней было бы не трогать поле "tags", а просто добавить свое поле "tag", но я не знаю как это сделать в рамках FastEasyMapping. Можно конечно добавить "tag" прямо в JSON, но наверное это не правильно, и не совсем понятно кто это должен делать, InstagramManager?
    FEMAttribute *tagAttribute =
    [[FEMAttribute alloc] initWithProperty:@"tag"
                                   keyPath:@"tags"
                                       map:^id(id value) {
                                           return requestedTag;
                                       }
                                reverseMap:^id(id value) {
                                    return nil;
                                }];
    [mapping addAttribute:tagAttribute];
    
    [mapping addAttributesFromDictionary:@{@"captionText": @"caption.text"}];
    [mapping addAttributesFromDictionary:@{@"identifier": @"id"}];
    
    return mapping;
}

@end

