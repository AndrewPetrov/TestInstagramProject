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
#import "TIInstagramPostsPaginationInfo.h"

@implementation TIInstagramManager

+ (NSURLRequest *)userAuthorizationRequest {
    NSString *uriString = [NSString stringWithFormat:@"https://api.instagram.com/oauth/authorize/?client_id=482b2956910b48ef9f33157622977803&redirect_uri=%@&response_type=token", redirect_uri];
    return [NSURLRequest requestWithURL:[NSURL URLWithString:uriString]];
}

+ (void)saveTokenFromRedirectUriRequest:(NSURLRequest *)request {
    NSArray *urlParams = [request.URL.fragment componentsSeparatedByString:@"="];
    NSString *token = urlParams[[urlParams indexOfObject:@"access_token"] + 1];
    TIUser *user = [TIUser MR_createEntity];
    user.token = token;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

+ (void)requestRecentPostWithTag:(NSString *)tag
                  paginationInfo:(TIInstagramPostsPaginationInfo *)paginationInfo
                 complitionBlock:(TICompletionBlock) completionBlock {
    
    TIInstagramRequest *request = [TIInstagramRequestFactory instagramRequestWithTag:tag paginationInfo:paginationInfo];
    
    void (^completionBlock1)(NSDictionary *, NSError *) = ^(NSDictionary *results, NSError *error) {
        TIInstagramPostsPaginationInfo *paginationInfoResult = [TIInstagramMapingManager mapPaginationInfoFromJSONDictionary:results[@"pagination"]];
        completionBlock(paginationInfoResult, nil);
        [TIInstagramMapingManager mapPostsFromJSONArray:results[@"data"]];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    };
    [request fetchRequestWithComplitionBlock:completionBlock1];
}

@end