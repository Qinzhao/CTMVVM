//
//  AppDelegate.m
//  CTMVVM
//
//  Created by AllenQin on 16/3/25.
//  Copyright © 2016年 AllenQin. All rights reserved.
//

#import "AppDelegate.h"
#import "CTHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self makeWindowVisible:launchOptions];
    return YES;
}

- (void)makeWindowVisible:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[CTHomeViewController alloc] init]];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
}



@end
