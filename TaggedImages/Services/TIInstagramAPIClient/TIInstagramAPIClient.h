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

+ (void)fetchInstagramRecentPostsRequestWithTag:(NSString *)tag
                                 paginationInfo:(TIInstagramPostsPaginationInfo *)paginationInfo
                                        success:(void(^)(NSDictionary* results))successBlock
                                        failure:(void(^)(NSError *error))failureBlock;

@end
