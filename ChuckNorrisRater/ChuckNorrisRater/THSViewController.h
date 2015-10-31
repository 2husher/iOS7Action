//
//  ViewController.h
//  ChuckNorrisRater
//
//  Created by X on 30/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface THSViewController : UIViewController

@property (nonatomic, strong) UILabel *jokeLabel;

- (void)voteUp;
- (void)voteDown;
- (void)chuckWho;

@end
