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
#import "TIInstagramPostsPaginationInfo.h"
#import "TIInstagramPostsPaginationInfo+Mapping.h"
#import <MagicalRecord.h>

@implementation TIInstagramMapingManager

+ (void)mapPostsFromJSONArray:(NSArray *)jsonArray {
    FEMMapping *mapping = [TIInstagramPost defaultMapping];
    [FEMDeserializer collectionFromRepresentation:jsonArray
                                          mapping:mapping
                                          context:[NSManagedObjectContext MR_defaultContext]];
    [[NSManagedObjectContext MR_defaultContext] save:nil];
}

+ (TIInstagramPostsPaginationInfo *)mapPaginationInfoFromJSONDictionary:(NSDictionary *)jsonDictionary {
    FEMMapping *mapping = [TIInstagramPostsPaginationInfo defaultMapping];
    TIInstagramPostsPaginationInfo *postsPaginationInfo =
        [FEMDeserializer objectFromRepresentation:jsonDictionary
                                          mapping:mapping];
        
    NSLog(@"postsPaginationInfo ================== \n\n%@\n\postsPaginationInfo ==================", postsPaginationInfo);
    return postsPaginationInfo;
}

@end
