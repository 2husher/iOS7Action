//
//  THSAppDelegate.m
//  ChuckNorrisRater
//
//  Created by X on 30/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "THSAppDelegate.h"
#import "THSViewController.h"

@implementation THSAppDelegate

- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];

    self.viewController = [[THSViewController alloc] initWithNibName:nil
                                                              bundle:nil];
    self.window.rootViewController = self.viewController;
    self.window.backgroundColor = [UIColor whiteColor];

    [self.window makeKeyAndVisible];
    return YES;
}

@end
