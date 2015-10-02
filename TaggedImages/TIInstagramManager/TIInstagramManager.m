//
//  TIInstagramManager.m
//  
//
//  Created by Андрей on 10/1/15.
//
//

#import "TIInstagramManager.h"
#import <FastEasyMapping.h>
#import "TIInstagramPost.h"
#import "TIInstagramPost+Mapping.h"
#import <MagicalRecord.h>

@implementation TIInstagramManager

+ (void)fetchInstagfamPost:(NSData *)json {
    
    FEMMapping *mapping = [TIInstagramPost defaultMapping];
    TIInstagramPost *instagramPost = [FEMDeserializer objectFromRepresentation:json
                                                                       mapping:mapping
                                                                       context:[NSManagedObjectContext MR_defaultContext]];
    NSLog(@"%@", instagramPost);
}

@end
