//
//  TIInstagramAPIClient.h
//  TaggedImages
//
//  Created by Андрей on 10/15/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TIInstagramPostsPaginationInfo;

@interface TIInstagramAPIClient : NSObject

+ (NSURLRequest *)instagramUserAuthorizationRequest;

+ (void)fetchInstagramRecentPostsRequestWithTag:(NSString *)tag
                                 paginationInfo:(TIInstagramPostsPaginationInfo *)paginationInfo
                                complitionBlock:(void(^)(NSDictionary* results, NSError *error))completionBlock
                                   failureBlock:(void(^)(NSDictionary* results, NSError *error))failureBlock;

@end
