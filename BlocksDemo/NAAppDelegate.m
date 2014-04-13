//
//  NAAppDelegate.m
//  BlocksDemo
//
//  Created by Nicolas Ameghino on 3/25/14.
//  Copyright (c) 2014 Nicolas Ameghino. All rights reserved.
//

#import "NAAppDelegate.h"

#import "NARootViewController.h"
#import "NABlockyTableViewController.h"


#import "NABlockMemoryManagementDemo.h"

@implementation NAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    dispatch_queue_t myQueue =
    dispatch_queue_create("org.nameghino.nsconfarg.queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(myQueue, ^{
        NSLog(@"Hello, world!");
    });
    
    NABlockMemoryManagementDemo *c = [[NABlockMemoryManagementDemo alloc] init];
    [c testMethod];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    //UIViewController *rootViewController = [[NARootViewController alloc] init];
    NABlockyTableViewController *rootViewController = [[NABlockyTableViewController alloc] init];
    rootViewController.data = @[@"WWDC 2014", @"NSConfArg"];
    
    UINavigationController *navigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:rootViewController];
    
    
    navigationController.navigationBarHidden = YES;
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
