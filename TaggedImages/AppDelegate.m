//
//  AppDelegate.m
//  TaggedImages
//
//  Created by Андрей on 9/29/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "AppDelegate.h"
#import "TIInstagramManager.h"
#import <MagicalRecord.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStack];
    return YES;
}

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
