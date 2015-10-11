//
//  TIInstagramRequestFactory.h
//  TaggedImages
//
//  Created by Андрей on 10/5/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TIInstagramRequest;

@interface TIInstagramRequestFactory : NSObject

+ (TIInstagramRequest *)instagramRequestWithTag:(NSString *)tag withNextUrl:(NSString *)nextUrl;

@end
