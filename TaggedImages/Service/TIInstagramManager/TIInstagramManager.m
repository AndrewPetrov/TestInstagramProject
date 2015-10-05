//
//  TIInstagramManager.m
//
//
//  Created by Андрей on 10/1/15.
//
//

#import "TIInstagramManager.h"
#import <FastEasyMapping.h>
#import "TIInstagramPost.h"
#import "TIInstagramPost+Mapping.h"
#import <MagicalRecord.h>
#import "TIInstagramMapingManager.h"

@implementation TIInstagramManager

+ (void)fetchInstagramPost:(NSData *)json {
    [TIInstagramMapingManager mapPostFromJson:json];
    NSArray *posts = [TIInstagramPost MR_findAll];
    NSLog(@"%@",posts);
}

@end
