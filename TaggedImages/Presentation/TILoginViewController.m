//
//  TILoginViewController.m
//  TaggedImages
//
//  Created by Андрей on 10/7/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TILoginViewController.h"

const NSString* redirect_uri = @"taggedimage://redirect.com";
const NSString* redirect_uri_domain = @"redirect.com";


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
    NSString* token = nil;
    if ([request.URL.host isEqualToString:(NSString *)redirect_uri_domain]) {
        
        NSArray* urlParams = [request.URL.fragment componentsSeparatedByString:@"="];
        
        token = urlParams[[urlParams indexOfObject:@"access_token"] + 1];
    }
    
    
    //        taggedimage://redirect.com#access_token=1323823338.482b295.e20882b4a7064d13acc5f25e81e10eb4
    
    if (token) {
        
        NSLog(@"%@", token);
    } else {
        // ERROR!
    }
    
    [webView removeFromSuperview];
    
    return YES;
}


@end
