//
//  TIInstagramRequestFactory.h
//  TaggedImages
//
//  Created by Андрей on 10/5/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TIInstagramRequest;
@class TIInstagramPostsPaginationInfo;

@interface TIInstagramRequestFactory : NSObject

+ (TIInstagramRequest *)instagramRequestWithTag:(NSString *)tag
                                 paginationInfo:(TIInstagramPostsPaginationInfo *)paginationInfo;

@end
