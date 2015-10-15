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
//    тут я присваиваю тот тег, по которому был поиск, каждому посту из этой выборки, т к сохранено в кордате может быть много постов, но для показа они отбираются по тегу. Хотя этот тег есть в сиске тегов, в объекте, который приходит с сервера, но каждый раз он на другом месте в списке тегов (то в начале, то в середине), поэтому просто так его оттуда получить нельзя. Я думал реализовать еще одну модель в кордате - тег, и чтобы каждый пост был связан с множеством тегов, а также хранить историю тегов, но т к информация слишком быстро меняется, то вероятность прочитать посты которые есть в кордате, а не более свежие, очень маленькая, поэтому пока отказался от этой идеи.
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

