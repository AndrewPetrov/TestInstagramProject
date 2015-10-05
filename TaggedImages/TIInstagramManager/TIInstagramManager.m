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
    
    NSError* error;
    FEMMapping *mapping = [TIInstagramPost defaultMapping];
    
    NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:json
                                                             options:kNilOptions
                                                               error:&error];
    
    [FEMDeserializer collectionFromRepresentation:jsonDict[@"data"]
                                          mapping:mapping
                                          context:[NSManagedObjectContext MR_defaultContext]];
    
    [[NSManagedObjectContext MR_defaultContext] save:nil];
    NSArray *posts = [TIInstagramPost MR_findAll];
    NSLog(@"%@",posts);
}

@end
