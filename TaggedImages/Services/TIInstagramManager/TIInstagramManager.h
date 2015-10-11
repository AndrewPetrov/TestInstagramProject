//
//  TIInstagramManager.h
//  
//
//  Created by Андрей on 10/1/15.
//
//

#import <Foundation/Foundation.h>
@class NSDictionary;
@class NSError;

typedef void(^TICompletionBlock)(NSDictionary *dictionary, NSError *error);


@interface TIInstagramManager : NSObject

+ (NSURLRequest *)userAuthorizationRequest;
+ (void)saveTokenFromRedirectUriRequest:(NSURLRequest *)request;
+ (void)requestRecentPostWithTag:(NSString *)tag
                     withNextUrl:(NSString *)nextUrl
             withComplitionBlock:(TICompletionBlock) completionBlock;

@end
