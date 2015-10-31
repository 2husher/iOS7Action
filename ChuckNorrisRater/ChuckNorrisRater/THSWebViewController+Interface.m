//
//  THSWebViewController+Interface.m
//  ChuckNorrisRater
//
//  Created by X on 31/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "THSWebViewController+Interface.h"

@implementation THSWebViewController (Interface)

- (void)addWebView
{
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];
}

- (void)addNavBar
{
    CGFloat width = self.view.frame.size.width;
    CGRect frame = CGRectMake(0.0f, 0.0f, width, 64.0f);
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:frame];

    self.navigationItem.title = @"Chuck Norris";
    [navBar pushNavigationItem:self.navigationItem animated:NO];

    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(dismissView)];

    [self.view addSubview:navBar];
}

- (void)addTabBar
{
    CGFloat width = self.view.frame.size.width;
    CGRect frame = CGRectMake(0.0f, self.view.frame.size.height - 44.0f, width, 44.0f);
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:frame];

    frame = CGRectMake(0.0f, 0.0f, 50.0f, 30.0f);
    UIBarButtonItem *backBtn =
    [[UIBarButtonItem alloc] initWithTitle:@"<"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(back)];
    UIBarButtonItem *forwardBtn =
    [[UIBarButtonItem alloc] initWithTitle:@">"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(forward)];

    [toolBar setItems:@[backBtn, forwardBtn]];

    [self.view addSubview:toolBar];
}

@end










