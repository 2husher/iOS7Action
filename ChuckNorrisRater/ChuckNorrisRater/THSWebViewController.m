//
//  THSWebViewController.m
//  ChuckNorrisRater
//
//  Created by X on 31/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "THSWebViewController.h"
#import "THSWebViewController+Interface.h"

@interface THSWebViewController ()

@end

@implementation THSWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addWebView];
    [self addNavBar];
    [self addTabBar];

    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Chuck_Norris"]];
    [self.webView loadRequest:request];
}

- (void)dismissView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)back
{
    [self.webView goBack];
}

- (void)forward
{
    [self.webView goForward];
}

@end
