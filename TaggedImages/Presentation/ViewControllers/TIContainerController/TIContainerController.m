//
//  TIContainerController.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TIContainerController.h"
#import "TITableViewController.h"
#import "TICollectionViewController.h"
#import "UIImage+TaggedImages.h"
#import "TIPresentationConstants.h"
#import "TITableViewDataSource.h"

@interface TIContainerController ()

@property (nonatomic, strong) TITableViewController* tableVC;
@property (nonatomic, strong) TICollectionViewController *collectionVC;
@property (nonatomic, strong) UIImage *togglePresentationImage;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *togglePresentationButton;
@property (nonatomic, assign) BOOL transitionInProgress;
@property (nonatomic, strong) NSString *tag;

@end

@implementation TIContainerController

+ (TIContainerController *)initWithTag:(NSString *)tag {
    TIContainerController *containerController = [[TIContainerController alloc] init];
    containerController.tag = tag;
    return containerController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.tableVC = [storyboard instantiateViewControllerWithIdentifier:TITableViewControllerIdentifier];
    self.tableVC.allPosts = [[TITableViewDataSource alloc] init];
    self.tableVC.allPosts.tag = self.tag;
    self.tableVC.allPosts.tableView = self.tableVC.tableView;
    
    self.collectionVC = [storyboard
                         instantiateViewControllerWithIdentifier:TICollectionViewControllerIdentifier];
//    post TagNotification
    self.togglePresentationImage = [UIImage collectionImage];
    self.navigationItem.title = self.tag;
    
    [self displayContentController:self.tableVC];
    self.transitionInProgress = NO;
}

- (void)displayContentController:(UIViewController *)content {
    [self addChildViewController:content];
    content.view.frame = self.view.bounds;
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

- (void)swapViewController:(UIViewController *)oldVC toViewController:(UIViewController *)newVC {
    newVC.view.frame = self.view.bounds;
    [oldVC willMoveToParentViewController:nil];
    [self addChildViewController:newVC];
    [self transitionFromViewController:oldVC
                      toViewController:newVC
                              duration:0.5
                               options:UIViewAnimationOptionTransitionFlipFromLeft
                            animations:nil
                            completion:^(BOOL finished) {
                                [oldVC removeFromParentViewController];
                                [newVC didMoveToParentViewController:self];
                                self.transitionInProgress = NO;
                            }];
}

- (void)updateTogglePresentationButtonItemPicture {
    if ([self.childViewControllers lastObject] == self.collectionVC) {
        self.togglePresentationButton.image = [UIImage tableImage];;
    }
    else {
        self.togglePresentationButton.image = [UIImage collectionImage];;
    }
}

- (IBAction)toggleInstrumentsPresentation:(UIBarButtonItem *)sender {
    if (self.transitionInProgress) {
        return;
    }
    self.transitionInProgress = YES;
    UIViewController *oldVC = [self.childViewControllers lastObject];
    if ([oldVC isEqual:self.tableVC]) {
        [self swapViewController:oldVC toViewController:self.collectionVC];
    }
    else {
        [self swapViewController:oldVC toViewController:self.tableVC];
    }
    [self updateTogglePresentationButtonItemPicture];
}


@end