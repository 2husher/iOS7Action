//
//  THSWebViewController.h
//  ChuckNorrisRater
//
//  Created by X on 31/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface THSWebViewController : UIViewController

@property (nonatomic, strong) UIWebView *webView;

- (void)dismissView;
- (void)back;
- (void)forward;

@end
