//
//  TIInstagramRequest.m
//  TaggedImages
//
//  Created by Андрей on 10/5/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TIInstagramRequest.h"

@interface TIInstagramRequest ()

@property (nonatomic, strong) NSString *requestString;

@end

@implementation TIInstagramRequest

+ (TIInstagramRequest *)initWithString:(NSString *)string {
    TIInstagramRequest *request = [[TIInstagramRequest alloc] init];
    request.requestString = string;
    return request;
}

- (void)fetchRequestWithComplitionBlock:(void(^)(NSArray *result, NSError *error))completionBlock {
    NSString *results;
    // perform request over AFNetworking
    // getting result (list of instruments in JSON fromat) int results paramter;
    
    if (completionBlock) {
        completionBlock(results, nil);
    }
}
@end
