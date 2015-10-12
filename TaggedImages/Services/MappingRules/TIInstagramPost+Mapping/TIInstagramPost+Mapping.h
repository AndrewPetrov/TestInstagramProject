//
//  TIInstagramPost+Mapping.h
//  TaggedImages
//
//  Created by Андрей on 10/1/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TIInstagramPost.h"
@class FEMMapping;

@interface TIInstagramPost (Mapping)

+ (FEMMapping *)defaultMappingWithRequestedTag:(NSString *)requestedTag;

@end
