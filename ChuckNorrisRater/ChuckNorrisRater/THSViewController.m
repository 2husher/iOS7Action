//
//  ViewController.m
//  ChuckNorrisRater
//
//  Created by X on 30/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "THSViewController.h"
#import "THSWebViewController.h"

@interface THSViewController ()

@end

@implementation THSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addLabel];
    [self addButtonVoteUp];
    [self addButtonVoteDown];
    [self addButtonChuckWho];
}

- (void)addLabel
{
    CGFloat width = self.view.frame.size.width - 40.0f;
    CGFloat y = self.view.frame.size.height / 2.0f - 200.0f;
    CGRect labelFrame = CGRectMake(20.0f, y, width, 200.0f);
    UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
    label.text = @"Quotation goes here and continues and continues until I am fed up to type.";
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:16.0f];

    [self.view addSubview:label];
}

- (void) addButtonVoteUp
{
    UIButton *voteUpButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [voteUpButton setTitle:@"Vote Up" forState:UIControlStateNormal];
    CGFloat x = self.view.frame.size.width / 2.0 - 50.0f;
    CGFloat y = self.view.frame.size.height / 2.0 + 0.0f;
    voteUpButton.frame = CGRectMake(x, y, 100.0f, 50.0f);

    [voteUpButton addTarget:self
                     action:@selector(voteUp)
           forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:voteUpButton];
}

-(void) addButtonVoteDown
{
    UIButton *voteDownButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [voteDownButton setTitle:@"Vote Down" forState:UIControlStateNormal];
    CGFloat x = self.view.frame.size.width / 2.0 - 50.0f;
    CGFloat y = self.view.frame.size.height / 2.0 + 50.0f;
    voteDownButton.frame = CGRectMake(x, y, 100.0f, 50.0f);

    [voteDownButton addTarget:self
                       action:@selector(voteDown)
             forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:voteDownButton];
}

- (void)addButtonChuckWho
{
    UIButton *chuckWhoButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [chuckWhoButton setTitle:@"Chuck Who?" forState:UIControlStateNormal];
    CGFloat x = self.view.frame.size.width / 2.0 - 50.0f;
    CGFloat y = self.view.frame.size.height / 2.0 + 150.0f;
    chuckWhoButton.frame = CGRectMake(x, y, 100.0f, 50.0f);

    [chuckWhoButton addTarget:self
                       action:@selector(chuckWho)
             forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:chuckWhoButton];
}

- (void)voteUp
{
    NSLog(@"Vote Up");
}

- (void)voteDown
{
    NSLog(@"Vote Down");
}

- (void)chuckWho
{
    NSLog(@"Chuck Who?");
    THSWebViewController *webViewController = [[THSWebViewController alloc] init];

    [self presentViewController:webViewController animated:YES completion:nil];
}

@end



































