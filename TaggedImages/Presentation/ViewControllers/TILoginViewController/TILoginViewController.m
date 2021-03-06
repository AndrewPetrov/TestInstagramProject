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
#import "TIPresentationConstants.h"
#import "TIServicesConstants.h"

@interface TILoginViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *loginWebView;

@end

@implementation TILoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//#warning webView лучше было в сториборде создать
    NSURLRequest *request = [TIInstagramManager userAuthorizationRequest];
    [self.loginWebView loadRequest:request];
    
    [self.view addSubview:self.loginWebView];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *redirect_uri_domain = [[TITaggedimageRedirectString componentsSeparatedByString:@"//"] lastObject];
    if ([request.URL.host isEqualToString:(NSString *)redirect_uri_domain]) {
        [TIInstagramManager saveTokenFromRedirectUriRequest:request];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TITagViewController *tagViewController = [storyboard instantiateViewControllerWithIdentifier:TITagViewControllerIdentifier];
        [self.navigationController pushViewController:tagViewController animated:YES];
    }
    return YES;
}

@end
