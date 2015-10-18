//
//  TITokenProvider.m
//  TaggedImages
//
//  Created by Андрей on 10/18/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TITokenProvider.h"
#import "TIUser.h"
#import <MagicalRecord.h>

@implementation TITokenProvider

+ (NSString *)accessTokenString {
    return [TIUser MR_findFirst].token;
}

@end
