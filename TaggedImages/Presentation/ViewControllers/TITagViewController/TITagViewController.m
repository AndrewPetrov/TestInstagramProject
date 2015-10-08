//
//  TITagViewController.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TITagViewController.h"

@interface TITagViewController ()

@end

@implementation TITagViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
         NSLog(@"TITagViewController init");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"TITagViewController viewDidLoad");
    // Do any additional setup after loading the view.
}
- (void)dealloc {
    NSLog(@"TITagViewController dealloc");
}

@end
