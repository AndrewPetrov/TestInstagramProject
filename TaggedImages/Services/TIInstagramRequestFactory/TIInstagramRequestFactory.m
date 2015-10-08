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

@implementation TIInstagramRequestFactory

+ (TIInstagramRequest *)instagramRequestWithTagTokenFromId:(NSString *)idString {
    NSString *tokenString = [TIUser MR_findFirst].token;
    NSString *tag = @"cars";
    NSLog(@"\n\ntokenString = %@", tokenString);
    NSString *requestString =
    [NSString stringWithFormat:@"https://api.instagram.com/v1/tags/%@/media/recent?access_token=%@", tag, tokenString];
    if (idString) {
        requestString = [NSString stringWithFormat:@"%@&min_id=%@", requestString, idString];
    }
    TIInstagramRequest *request = [TIInstagramRequest initWithString:requestString];
    return request;
}

@end
