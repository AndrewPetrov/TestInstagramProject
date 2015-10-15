//
//  TIInstagramPostsPaginationIDs.h
//  TaggedImages
//
//  Created by Андрей on 10/11/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TIInstagramPostsPaginationInfo : NSObject

//#warning в именах свойств надо использовать Camel Case
@property (nonatomic, strong) NSString *nextMaxTagId;
@property (nonatomic, strong) NSString *minTagId;
@property (nonatomic, strong) NSString *nextUrl;

@end
