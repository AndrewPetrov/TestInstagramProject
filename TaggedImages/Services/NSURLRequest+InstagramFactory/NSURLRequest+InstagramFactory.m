//
//  NSURLRequest+InstagramFactory.m
//  TaggedImages
//
//  Created by Андрей on 10/15/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "NSURLRequest+InstagramFactory.h"
#import "TIInstagramPostsPaginationInfo.h"
#import <MagicalRecord.h>
#import "TIServicesConstants.h"
#import "TIUser.h"

@implementation NSURLRequest (InstagramFactory)

+ (NSURLRequest *)instagramUserAuthorizationRequest {
    NSString *uriString = [NSString stringWithFormat:TIInstagramAuthorizationRequestString, TITaggedimageRedirectString];
    return [NSURLRequest requestWithURL:[NSURL URLWithString:uriString]];
}

+ (NSURLRequest *)instagramRecentPostsRequestWithTag:(NSString *)tag
                                 paginationInfo:(TIInstagramPostsPaginationInfo *)paginationInfo {
    NSString *requestString;
    if (paginationInfo) {
        requestString = paginationInfo.nextUrl;
    } else {
        NSString *tokenString = [TIUser MR_findFirst].token;
        requestString =
        [NSString stringWithFormat:TIInstagramPostsRequestString, tag, tokenString, TITaggedPostsPageSize];
    }
    return [NSURLRequest requestWithURL:[NSURL URLWithString:requestString]];
}

@end


