//
//  InstagramMapingManager.h
//  
//
//  Created by Андрей on 10/1/15.
//
//

#import <Foundation/Foundation.h>
@class TIInstagramPostsPaginationIDs;

@interface TIInstagramMapingManager : NSObject

+ (void)mapPostsFromJSONArray:(NSArray *)jsonArray;
+ (TIInstagramPostsPaginationIDs *)mapPaginationIDsFromJSON:(NSDictionary *)jsonDictionary;

@end
