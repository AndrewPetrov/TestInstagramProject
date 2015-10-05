//
//  InstagramMapingManager.m
//
//
//  Created by Андрей on 10/1/15.
//
//

#import "TIInstagramMapingManager.h"
#import <FastEasyMapping.h>
#import "TIInstagramPost.h"
#import "TIInstagramPost+Mapping.h"
#import <MagicalRecord.h>

@implementation TIInstagramMapingManager

+ (void)mapPostFromJson:(NSData *)jsonData {
    NSError* error;
    NSDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData
                                                             options:kNilOptions
                                                               error:&error];
    FEMMapping *mapping = [TIInstagramPost defaultMapping];
    [FEMDeserializer collectionFromRepresentation:jsonDict[@"data"]
                                          mapping:mapping
                                          context:[NSManagedObjectContext MR_defaultContext]];
    [[NSManagedObjectContext MR_defaultContext] save:nil];
}

@end
