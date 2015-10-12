//
//  TIInstagramRequestFactory.m
//  TaggedImages
//
//  Created by Андрей on 10/5/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TIInstagramRequestFactory.h"
#import "TIInstagramRequest.h"
#import "TIUser.h"
#import <MagicalRecord.h>
#import "TIPresentationConstants.h"
#import "TIInstagramPostsPaginationInfo.h"

@implementation TIInstagramRequestFactory

+ (TIInstagramRequest *)instagramRequestWithTag:(NSString *)tag
                                 paginationInfo:(TIInstagramPostsPaginationInfo *)paginationInfo {
    NSString *requestString;
    if (paginationInfo) {
        requestString = paginationInfo.next_url;
    } else {
        NSString *tokenString = [TIUser MR_findFirst].token;
        requestString =
        [NSString stringWithFormat:@"https://api.instagram.com/v1/tags/%@/media/recent?access_token=%@&count=%ld", tag, tokenString, CollectionViewFirstLoadPostsCount];
    }
    return [TIInstagramRequest initWithString:requestString];
    //TODO:  Think about what if we have several users
    //    NSString *tokenString = [TIUser MR_findFirst].token;
}

@end
