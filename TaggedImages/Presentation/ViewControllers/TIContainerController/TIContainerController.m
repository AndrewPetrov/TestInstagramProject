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
#import "TITaggedPostsTableViewDataSource.h"
#import "TITaggedPostsCollectionViewDataSource.h"

@interface TIContainerController ()

@property (nonatomic, strong) TITableViewController* tableVC;
@property (nonatomic, strong) TICollectionViewController *collectionVC;
@property (nonatomic, strong) UIImage *togglePresentationImage;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *togglePresentationButton;
@property (nonatomic, assign) BOOL transitionInProgress;

@end

@implementation TIContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.tableVC = [storyboard instantiateViewControllerWithIdentifier:TITableViewControllerIdentifier];
    self.tableVC.taggedPostsDataSource = [[TITaggedPostsTableViewDataSource alloc] initWithTag:self.tag
                                                                                     tableView:self.tableVC.tableView];
    
    self.collectionVC = [storyboard
                         instantiateViewControllerWithIdentifier:TICollectionViewControllerIdentifier];
    self.collectionVC.taggedPostsDataSource =
    [[TITaggedPostsCollectionViewDataSource alloc] initWithTag:self.tag
                                                collectionView:self.collectionVC.collectionView];
    
    self.togglePresentationImage = [UIImage collectionImage];
    self.navigationItem.title = [NSString stringWithFormat:@"#%@",self.tag];
    self.transitionInProgress = NO;
    [self displayContentController:self.tableVC];
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
//#warning длительность анимации должна быть в константах
    [self transitionFromViewController:oldVC
                      toViewController:newVC
                              duration:TITransitionDuration
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
        self.collectionVC.taggedPostsDataSource.postsPaginationInfo = self.tableVC.taggedPostsDataSource.postsPaginationInfo;
        [self swapViewController:oldVC toViewController:self.collectionVC];
    }
    else {
        self.tableVC.taggedPostsDataSource.postsPaginationInfo = self.collectionVC.taggedPostsDataSource.postsPaginationInfo;
        [self swapViewController:oldVC toViewController:self.tableVC];
    }
    [self updateTogglePresentationButtonItemPicture];
}

@end
