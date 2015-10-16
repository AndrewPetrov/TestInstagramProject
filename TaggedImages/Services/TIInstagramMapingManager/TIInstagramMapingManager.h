//
//  InstagramMapingManager.h
//  
//
//  Created by Андрей on 10/1/15.
//
//

#import <Foundation/Foundation.h>

@class TIInstagramPostsPaginationInfo;

#warning mapping
@interface TIInstagramMapingManager : NSObject

+ (void)mapPostsFromJSONArray:(NSArray *)jsonArray withRequestedTag:(NSString *)requestedTag;
+ (TIInstagramPostsPaginationInfo *)mapPaginationInfoFromJSONDictionary:(NSDictionary *)jsonDictionary;

@end
