//
//  TIInstagramAPIClient.m
//  TaggedImages
//
//  Created by Андрей on 10/15/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TIInstagramAPIClient.h"
#import "NSURLRequest+InstagramFactory.h"
#import <AFNetworking.h>

@implementation TIInstagramAPIClient

+ (void)fetchInstagramRecentPostsRequestWithTag:(NSString *)tag
                                 paginationInfo:(TIInstagramPostsPaginationInfo *)paginationInfo
                                        success:(void(^)(NSDictionary* results))successBlock
                                        failure:(void(^)(NSError *error))failureBlock {
    NSURLRequest *request = [NSURLRequest instagramRecentPostsRequestWithTag:tag
                                                              paginationInfo:paginationInfo];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successBlock) {
            successBlock((NSDictionary *)responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failureBlock) {
            failureBlock (error);
        }
    }];
    [operation start];
}

+ (NSURLRequest *)instagramUserAuthorizationRequest {
    return [NSURLRequest instagramUserAuthorizationRequest];
}

@end

