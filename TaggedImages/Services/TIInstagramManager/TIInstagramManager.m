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
#import "TILoginViewController.h"
#import "TIUser.h"

@implementation TIInstagramManager

+ (NSURLRequest *)userAuthorizationRequest {
    NSString *uriString = [NSString stringWithFormat:@"https://api.instagram.com/oauth/authorize/?client_id=482b2956910b48ef9f33157622977803&redirect_uri=%@&response_type=token", redirect_uri];
    return [NSURLRequest requestWithURL:[NSURL URLWithString:uriString]];
}

+ (void)fetchInstagramPost:(NSData *)json {
    [TIInstagramMapingManager mapPostFromJson:json];
    NSArray *posts = [TIInstagramPost MR_findAll];
    NSLog(@"%@",posts);
}

+ (void)saveTokenFromRedirectUriRequest:(NSURLRequest *)request {
    NSArray* urlParams = [request.URL.fragment componentsSeparatedByString:@"="];
    NSString *token = urlParams[[urlParams indexOfObject:@"access_token"] + 1];
    TIUser *user = [TIUser MR_createEntity];
    user.token = token;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

+ (void)requestRecentPostWithTagFromId:(NSString *)idString {
    TIInstagramRequest* request = [TIInstagramRequestFactory instagramRequestWithTagTokenFromId:idString];

    void(^completionBlock)(NSArray *, NSError *) = ^(NSArray* results, NSError *error) {
        FEMMapping *mapping = [TIInstagramPost defaultMapping];
        NSArray *posts = [FEMDeserializer collectionFromRepresentation:results
                                                               mapping:mapping
                                                               context:[NSManagedObjectContext MR_defaultContext]];
        for (TIInstagramPost *post in posts) {
            NSLog(@"%@", post);
        }
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    };
    [request fetchRequestWithComplitionBlock:completionBlock];
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