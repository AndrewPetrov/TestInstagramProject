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
                                complitionBlock:(void(^)(NSDictionary* results, NSError *error))completionBlock
                                   failureBlock:(void(^)(NSDictionary* results, NSError *error))failureBlock {
    NSURLRequest *request = [NSURLRequest instagramRecentPostsRequestWithTag:tag
                                                              paginationInfo:paginationInfo];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success");
        if (completionBlock) {
            completionBlock((NSDictionary *)responseObject, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure");
        if (failureBlock) {
            failureBlock (nil, error);
        }
    }];
    [operation start];
}


+ (NSURLRequest *)instagramUserAuthorizationRequest {
    return [NSURLRequest instagramUserAuthorizationRequest];
}

@end

