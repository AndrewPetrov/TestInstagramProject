//
//  TIInstagramRequest.m
//  TaggedImages
//
//  Created by Андрей on 10/5/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TIInstagramRequest.h"
#import "TIInstagramMapingManager.h"
#import <AFNetworking.h>

@interface TIInstagramRequest ()

@property (nonatomic, strong) NSURL *requestUrl;

@end

@implementation TIInstagramRequest

+ (TIInstagramRequest *)initWithUrl:(NSURL *)url {
    TIInstagramRequest *request = [[TIInstagramRequest alloc] init];
    request.requestUrl = url;
    return request;
}

- (void)fetchRequestWithComplitionBlock:(void(^)(NSDictionary* results, NSError *error))completionBlock {
    NSURLRequest *request = [NSURLRequest requestWithURL:self.requestUrl];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success");
        if (completionBlock) {
            completionBlock((NSDictionary *)responseObject, nil);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure");
    }];
    [operation start];
}
@end
