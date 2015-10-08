//
//  TITagViewController.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TITagViewController.h"
#import "TIContainerController.h"
#import "TIInstagramManager.h"

@interface TITagViewController ()

@property (nonatomic, weak) IBOutlet UITextField *tagField;

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
- (IBAction)sarchAction:(UIButton *)sender {
    [TIInstagramManager requestRecentPostWithTag:self.tagField.text fromId:nil];
            TIContainerController *containerController = [TIContainerController  initWithTag:self.tagField.text];
    [self.navigationController pushViewController:containerController animated:YES];
}

@end
