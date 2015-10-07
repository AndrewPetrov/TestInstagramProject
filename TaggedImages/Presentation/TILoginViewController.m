//
//  TILoginViewController.m
//  TaggedImages
//
//  Created by Андрей on 10/7/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//


#import "TILoginViewController.h"
const NSString* redirect_uri = @"https://github.com";

@interface TILoginViewController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *loginWebView;

@end

@implementation TILoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.loginWebView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    self.loginWebView.delegate = self;
    NSString *uriString = [NSString stringWithFormat:@"https://api.instagram.com/oauth/authorize/?client_id=482b2956910b48ef9f33157622977803&redirect_uri=%@&response_type=token", redirect_uri];
    
    NSURL *url = [NSURL URLWithString:uriString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.loginWebView loadRequest:request];
    
    
    [self.view addSubview:self.loginWebView];
    
    
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    //    [indicator startAnimating];
    
    NSString *extendedHost = [NSString stringWithFormat:@"https://%@", [[request URL] host]];
    NSLog(@"%@ = %@", extendedHost, redirect_uri);
    if ([extendedHost isEqualToString:redirect_uri]) {
        NSLog(@"%@", request);
        
        // Extract oauth_verifier from URL query
        NSString* verifier = nil;
        NSArray* urlParams = [[[request URL] query] componentsSeparatedByString:@"&"];
        for (NSString* param in urlParams) {
            NSArray* keyValue = [param componentsSeparatedByString:@"="];
            NSString* key = [keyValue objectAtIndex:0];
            if ([key isEqualToString:@"code"]) {
                verifier = [keyValue objectAtIndex:1];
                break;
            }
        }
        
        if (verifier) {
            
            NSLog(@"%@", verifier);
        } else {
            // ERROR!
        }
        
        [webView removeFromSuperview];
        
        return NO;
    }
    
    return YES;
}
@end
