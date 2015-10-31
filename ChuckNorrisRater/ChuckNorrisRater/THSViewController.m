//
//  ViewController.m
//  ChuckNorrisRater
//
//  Created by X on 30/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "THSViewController.h"
#import "THSWebViewController.h"
#import "THSHTTPCommunication.h"
#import "THSViewController+Interface.h"

@interface THSViewController ()
{
    NSNumber *jokeID;
}

@end

@implementation THSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addLabel];
    [self addButtonVoteUp];
    [self addButtonVoteDown];
    [self addButtonChuckWho];

    [self retrieveRandomJokes];
}

- (void)retrieveRandomJokes
{
    THSHTTPCommunication *http = [[THSHTTPCommunication alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://api.icndb.com/jokes/random"];

    // получаем шутки, используя экземпляр класса THSHTTPCommunication
    [http retrieveURL:url successBlock:^(NSData *response)
    {
        NSError *error = nil;

        // десериализуем полученную информацию
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response
                                                             options:0
                                                               error:&error];
        if (!error)
        {
            NSDictionary *value = data[@"value"];
            if (value && value[@"joke"])
            {
                jokeID = value[@"id"];
                [self.jokeLabel setText:value[@"joke"]];
            }
        }
    }];
}

- (void)voteUp
{
    NSURL *url = [NSURL URLWithString:@"http://example.com/rater/vote"];
    THSHTTPCommunication *http = [[THSHTTPCommunication alloc] init];
    NSDictionary *params = @{@"joke_id":jokeID, @"vote":@(1)};
    [http postURL:url params:params successBlock:^(NSData *response)
     {
         NSLog(@"Voted Up");
     }];
}

- (void)voteDown
{
    NSURL *url = [NSURL URLWithString:@"http://example.com/rater/vote"];
    THSHTTPCommunication *http = [[THSHTTPCommunication alloc] init];
    NSDictionary *params = @{@"joke_id":jokeID, @"vote":@(-1)};
    [http postURL:url params:params successBlock:^(NSData *response)
     {
         NSLog(@"Voted Down");
     }];

}

- (void)chuckWho
{
    THSWebViewController *webViewController = [[THSWebViewController alloc] init];

    [self presentViewController:webViewController animated:YES completion:nil];
}

@end



































