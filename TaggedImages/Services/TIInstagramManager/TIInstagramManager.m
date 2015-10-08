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
    [TIInstagramMapingManager mapPostFromJSONObjects:json];
    NSArray *posts = [TIInstagramPost MR_findAll];
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

    void(^completionBlock)(NSDictionary *, NSError *) = ^(NSDictionary* results, NSError *error) {
        [TIInstagramMapingManager mapPostFromJSONObjects:results];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    };
    [request fetchRequestWithComplitionBlock:completionBlock];
}

@end