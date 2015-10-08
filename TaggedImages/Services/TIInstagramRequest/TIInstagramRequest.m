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

@property (nonatomic, strong) NSString *requestString;

@end

@implementation TIInstagramRequest

+ (TIInstagramRequest *)initWithString:(NSString *)string {
    TIInstagramRequest *request = [[TIInstagramRequest alloc] init];
    request.requestString = string;
    return request;
}

- (void)fetchRequestWithComplitionBlock:(void(^)(NSDictionary* results, NSError *error))completionBlock {
//    __block NSArray *results;
    // perform request over AFNetworking
    // getting result (list of instruments in JSON fromat) int results paramter;
    
    NSURL *url = [NSURL URLWithString:self.requestString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
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
