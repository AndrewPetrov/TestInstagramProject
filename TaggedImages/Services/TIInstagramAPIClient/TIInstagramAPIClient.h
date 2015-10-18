//
//  TIInstagramAPIClient.h
//  TaggedImages
//
//  Created by Андрей on 10/15/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TIInstagramTypes.h"

@class TIInstagramPostsPaginationInfo;

@interface TIInstagramAPIClient : NSObject

//#warning типы блоков объявите через typedef
+ (void)fetchInstagramRecentPostsRequestWithTag:(NSString *)tag
                                 paginationInfo:(TIInstagramPostsPaginationInfo *)paginationInfo
                                        success:(dictionaryBlock)successBlock
                                        failure:(errorBlock)failureBlock;

@end
