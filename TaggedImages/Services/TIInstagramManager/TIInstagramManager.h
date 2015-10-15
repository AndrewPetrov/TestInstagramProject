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
@class TIInstagramPostsPaginationInfo;

@interface TIInstagramManager : NSObject

+ (NSURLRequest *)userAuthorizationRequest;
+ (void)saveTokenFromRedirectUriRequest:(NSURLRequest *)request;
+ (void)requestRecentPostWithTag:(NSString *)tag
                  paginationInfo:(TIInstagramPostsPaginationInfo *)paginationInfo
                         success:(void(^)(TIInstagramPostsPaginationInfo *paginationInfo)) successBlock
                         failure:(void(^)(NSError *error)) failureBlock;

@end
