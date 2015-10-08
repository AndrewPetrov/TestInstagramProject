//
//  TIInstagramManager.h
//  
//
//  Created by Андрей on 10/1/15.
//
//

#import <Foundation/Foundation.h>

@interface TIInstagramManager : NSObject

+ (NSURLRequest *)userAuthorizationRequest;
+ (void)saveTokenFromRedirectUriRequest:(NSURLRequest *)request;
//+ (void)fetchInstagramPost:(NSData *)json;
+ (void)requestRecentPostWithTagFromId:(NSString *)idString;

@end
