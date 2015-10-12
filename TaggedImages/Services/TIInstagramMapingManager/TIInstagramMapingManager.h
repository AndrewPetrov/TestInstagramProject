//
//  InstagramMapingManager.h
//  
//
//  Created by Андрей on 10/1/15.
//
//

#import <Foundation/Foundation.h>
@class TIInstagramPostsPaginationInfo;

@interface TIInstagramMapingManager : NSObject

+ (void)mapPostsFromJSONArray:(NSArray *)jsonArray;
+ (TIInstagramPostsPaginationInfo *)mapPaginationInfoFromJSONDictionary:(NSDictionary *)jsonDictionary;

@end
