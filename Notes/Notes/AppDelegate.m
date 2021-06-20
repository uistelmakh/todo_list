//
//  AppDelegate.m
//  Notes
//
//  Created by Sergey Stelmakh on 20.06.2021.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    MainViewController *controller = [[MainViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
