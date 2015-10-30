//
//  THSWebViewController.m
//  ChuckNorrisRater
//
//  Created by X on 31/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "THSWebViewController.h"

@interface THSWebViewController ()

@end

@implementation THSWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];

    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:webView];

    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Chuck_Norris"]];
    [webView loadRequest:request];

    CGFloat width = self.view.frame.size.width;
    CGRect frame = CGRectMake(0.0f, 0.0f, width, 64.0f);
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:frame];

    self.navigationItem.title = @"Chuck Norris";
    [navBar pushNavigationItem:self.navigationItem animated:NO];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(dismissView)];

    [self.view addSubview:navBar];
}

- (void)dismissView
{
    NSLog(@"Dismiss View");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
