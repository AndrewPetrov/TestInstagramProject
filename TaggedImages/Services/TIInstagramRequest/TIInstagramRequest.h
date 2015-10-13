//
//  TIInstagramRequest.h
//  TaggedImages
//
//  Created by Андрей on 10/5/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TIInstagramRequest : NSObject

+ (TIInstagramRequest *)initWithUrl:(NSURL *)url;
- (void)fetchRequestWithComplitionBlock:(void(^)(NSDictionary* results, NSError *error))completionBlock;

@end

