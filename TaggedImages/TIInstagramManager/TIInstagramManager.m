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
    
//    NSLog(@"%@", jsonDict);
    NSArray *dataArray = [FEMDeserializer collectionFromRepresentation:jsonDict[@"data"]
                                                             mapping:mapping
                                                             context:[NSManagedObjectContext MR_defaultContext]];
//     NSLog(@"+++++++++++++\n%@", dataArray);

    
    
//    TIInstagramPost *instagramPost = [FEMDeserializer objectFromRepresentation:dataArray
//                                                                       mapping:mapping
//                                                                       context:[NSManagedObjectContext MR_defaultContext]];
    NSLog(@"%@", dataArray[0]);
}

@end
