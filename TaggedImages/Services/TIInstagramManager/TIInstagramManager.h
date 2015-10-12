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

typedef void(^TICompletionBlock)(TIInstagramPostsPaginationInfo *paginationInfo, NSError *error);

@interface TIInstagramManager : NSObject

+ (NSURLRequest *)userAuthorizationRequest;
+ (void)saveTokenFromRedirectUriRequest:(NSURLRequest *)request;
+ (void)requestRecentPostWithTag:(NSString *)tag
                  paginationInfo:(TIInstagramPostsPaginationInfo *)paginationInfo
                 complitionBlock:(TICompletionBlock) completionBlock;

@end
