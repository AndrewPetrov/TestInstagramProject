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
#import "TIServicesConstants.h"

@implementation TIInstagramManager

+ (NSURLRequest *)userAuthorizationRequest {
    NSString *uriString = [NSString stringWithFormat:TIInstagramAuthorizationRequestString, TITaggedimageRedirectString];
    return [NSURLRequest requestWithURL:[NSURL URLWithString:uriString]];
}

+ (void)saveTokenFromRedirectUriRequest:(NSURLRequest *)request {
    NSArray *urlParams = [request.URL.fragment componentsSeparatedByString:@"="];
    NSString *token = urlParams[[urlParams indexOfObject:TIInstagramTokenKey] + 1];
    TIUser *user = [TIUser MR_createEntity];
    user.token = token;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

+ (void)requestRecentPostWithTag:(NSString *)tag
                  paginationInfo:(TIInstagramPostsPaginationInfo *)paginationInfo
                 complitionBlock:(TICompletionBlock) completionBlock {
    
    TIInstagramRequest *request = [TIInstagramRequestFactory instagramRequestWithTag:tag paginationInfo:paginationInfo];
    
    void (^requestCompletionBlock)(NSDictionary *, NSError *) = ^(NSDictionary *results, NSError *error) {
        TIInstagramPostsPaginationInfo *paginationInfoResult = [TIInstagramMapingManager mapPaginationInfoFromJSONDictionary:results[TIInstagramPaginationKey]];
        [TIInstagramMapingManager mapPostsFromJSONArray:results[TIInstagramDataKey] withRequestedTag:tag];

        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        completionBlock(paginationInfoResult, nil);
    };
    [request fetchRequestWithComplitionBlock:requestCompletionBlock];
}

@end