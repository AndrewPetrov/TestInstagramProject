//
//  NSURLRequest+InstagramFactory.h
//  TaggedImages
//
//  Created by Андрей on 10/15/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TIInstagramPostsPaginationInfo;

@interface NSURLRequest (InstagramFactory)

+ (NSURLRequest *)instagramUserAuthorizationRequest;

+ (NSURLRequest *)instagramRecentPostsRequestWithTag:(NSString *)tag
                                      paginationInfo:(TIInstagramPostsPaginationInfo *)paginationInfo;

@end
