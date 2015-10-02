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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStack];
    
    /*NSData *json = {
    "pagination":  {
        "next_max_tag_id": "1086420909647216708",
        "deprecation_warning": "next_max_id and min_id are deprecated for this endpoint; use min_tag_id and max_tag_id instead",
        "next_max_id": "1086420909647216708",
        "next_min_id": "1086421560956103521",
        "min_tag_id": "1086421560956103521",
        "next_url": "https://api.instagram.com/v1/tags/cars/media/recent?access_token=1323823338.1fb234f.59dac65f0af84cedb7c541d2f054d231&max_tag_id=1086420909647216708"
    },
    "meta":  {
        "code": 200
    },
    "data":  [
              {
                  "attribution": null,
                  "tags":  [
                            "followback",
                            "cars",
                            "followers",
                            "carspotting",
                            "carlife",
                            "follow4follow",
                            "carsofinstagram",
                            "likes4likes",
                            "carstagram",
                            "car",
                            "koenigsegg",
                            "likeback",
                            "followall",
                            "instacars",
                            "followtrain",
                            "carswithoutlimits",
                            "pictureoftheday",
                            "likeforlike",
                            "instacar",
                            "bestoftheday",
                            "like4like",
                            "followme",
                            "photooftheday"
                            ],
                  "type": "image",
                  "location": null,
                  "comments":  {
                      "count": 0,
                      "data":  []
                  },
                  "filter": "Normal",
                  "created_time": "1443731564",
                  "link": "https://instagram.com/p/8TvqdRHSth/",
                  "likes":  {
                      "count": 0,
                      "data":  []
                  },
                  "images":  {
                      "low_resolution":  {
                          "url": "https://scontent.cdninstagram.com/hphotos-xaf1/t51.2885-15/s320x320/e35/11939371_910488419045216_2060491438_n.jpg",
                          "width": 320,
                          "height": 320
                      },
                      "thumbnail":  {
                          "url": "https://scontent.cdninstagram.com/hphotos-xaf1/t51.2885-15/s150x150/e35/11939371_910488419045216_2060491438_n.jpg",
                          "width": 150,
                          "height": 150
                      },
                      "standard_resolution":  {
                          "url": "https://scontent.cdninstagram.com/hphotos-xaf1/t51.2885-15/s320x320/e35/11939371_910488419045216_2060491438_n.jpg",
                          "width": 320,
                          "height": 320
                      }
                  },
                  "users_in_photo":  [],
                  "caption":  {
                      "created_time": "1443731564",
                      "text": "***Follow***\n@amazingcars199\n@amazingcars247\n@shmee150\n#carlife #carsofinstagram #instacar #instacars #carstagram #car #carspotting #cars #carswithoutlimits #photooftheday #bestoftheday #pictureoftheday #followme #like4like #likeforlike #likeback #likes4likes #follow4follow #followback #followall #followers #followtrain\n#koenigsegg",
                      "from":  {
                          "username": "amazingcars199",
                          "profile_picture": "https://igcdn-photos-c-a.akamaihd.net/hphotos-ak-xaf1/t51.2885-19/s150x150/12070656_1479560475682826_337549867_a.jpg",
                          "id": "2214291865",
                          "full_name": ""
                      },
                      "id": "1086421563262970242"
                  },
                  "user_has_liked": false,
                  "id": "1086421560956103521_2214291865",
                  "user":  {
                      "username": "amazingcars199",
                      "profile_picture": "https://igcdn-photos-c-a.akamaihd.net/hphotos-ak-xaf1/t51.2885-19/s150x150/12070656_1479560475682826_337549867_a.jpg",
                      "id": "2214291865",
                      "full_name": ""
                  }
              }]
    }*/
    NSData *json = [NSData dataWithContentsOfFile:@"/developing/Yalantis/TaggedImages/TaggedImages/json.txt"];
    
    [TIInstagramManager fetchInstagfamPost:json];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "andrew.petrov.TaggedImages" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"TaggedImages" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"TaggedImages.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
