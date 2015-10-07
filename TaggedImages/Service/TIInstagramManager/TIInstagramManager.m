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
#import "TIInstagramMapingManager.h"
#import "TIInstagramRequest.h"
#import "TIInstagramRequestFactory.h"
#import <AFNetworking.h>

@implementation TIInstagramManager

+ (void)userAuthorizationRequest {
    
    
    
}

+ (void)fetchInstagramPost:(NSData *)json {
    [TIInstagramMapingManager mapPostFromJson:json];
    NSArray *posts = [TIInstagramPost MR_findAll];
    NSLog(@"%@",posts);
}

+ (void)requestRecentPostWithTagFromId:(NSString *)idString {
    
    TIInstagramRequest* request = [TIInstagramRequestFactory instagramRequestWithTagTokenFromId:idString];

    void(^completionBlock)(NSArray *, NSError *) = ^(NSArray* results, NSError *error) {
        FEMMapping *mapping = [TIInstagramPost defaultMapping];
        NSArray *persons = [FEMDeserializer collectionFromRepresentation:results
                                                                 mapping:mapping
                                                                 context:[NSManagedObjectContext MR_defaultContext]];
        //TODO: add array to context
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    };
//    [request fetchRequestWithComplitionBlock:completionBlock];


}

@end



//
//InstagramRequest *request = [InstagramRequestFactory getInstrumentsRequest];
//[request startWithCompletionBlock:completionBlock];



//
//
//+ requestRecentPostsWithTagFromId: {
//    getTokenFromCoreData
//    request = [instagramRequestFactory
//               instagramRequestWithTagAndToken]
//
//    completionBlock = ^(...){[InstagramManager +mapPostsFromJSON]};
//    [request fetchRquestWithCompletionBlock:completionBlock];
//
//
//
//    {savingToCoredata}}
//[request fetchRequestWithComplitionBlock ({complitionBlock})];

//returnType (^blockName)(parameterTypes) = ^returnType(parameters) {...};
//}