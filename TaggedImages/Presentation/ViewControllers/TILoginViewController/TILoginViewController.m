//
//  TILoginViewController.m
//  TaggedImages
//
//  Created by Андрей on 10/7/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TILoginViewController.h"
#import "TIInstagramManager.h"
#import "TITagViewController.h"
#import "TIContainerController.h"

const NSString* redirect_uri = @"taggedimage://redirect.com";
//extern const NSString* redirect_uri_domain = @"redirect.com";


@interface TILoginViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *loginWebView;

@end

@implementation TILoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.loginWebView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    self.loginWebView.delegate = self;
    NSURLRequest *request = [TIInstagramManager userAuthorizationRequest];
    [self.loginWebView loadRequest:request];
    
    [self.view addSubview:self.loginWebView];

}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    //    [indicator startAnimating];
    NSString *redirect_uri_domain = [redirect_uri componentsSeparatedByString:@"//"][1];
    if ([request.URL.host isEqualToString:(NSString *)redirect_uri_domain]) {
        [TIInstagramManager saveTokenFromRedirectUriRequest:request];
        [TIInstagramManager requestRecentPostWithTagFromId:nil];
        TITagViewController *tagViewController = [[TITagViewController alloc] init];
        [self.navigationController pushViewController:tagViewController animated:YES];
    }

    return YES;
}


@end
