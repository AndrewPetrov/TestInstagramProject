//
//  TITagViewController.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TITagViewController.h"
#import "TIContainerController.h"
#import "TIPresentationConstants.h"

@interface TITagViewController ()

@property (nonatomic, weak) IBOutlet UITextField *tagField;

@end

@implementation TITagViewController

- (IBAction)sarchAction:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TIContainerController *containerController = [storyboard instantiateViewControllerWithIdentifier:TIContainerControllerIdentifier];
    containerController.tag = self.tagField.text;
    [self.navigationController pushViewController:containerController animated:YES];
}

@end
