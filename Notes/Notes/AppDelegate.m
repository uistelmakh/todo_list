//
//  AppDelegate.m
//  Notes
//
//  Created by Sergey Stelmakh on 20.06.2021.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "SettingsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
   
    self.window.rootViewController = [self createTabBar];
    [self.window makeKeyAndVisible];

    return YES;
}

- (UINavigationController*) createMainViewNC {
    MainViewController *mainViewController = [[MainViewController alloc] init];
    
    mainViewController.title = @"Папки";
    mainViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"folder.png"] tag:0];
    UINavigationController *mainNavigationViewController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    return mainNavigationViewController;
}

- (UINavigationController*) createSettingsNC {
    SettingsViewController *settingsViewController = [[SettingsViewController alloc] init];
    settingsViewController.title = @"Настройки";
    settingsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"settings.png"] tag:1];
    UINavigationController *settingsNavigationViewController = [[UINavigationController alloc] initWithRootViewController:settingsViewController];
    return settingsNavigationViewController;
}

- (UITabBarController*) createTabBar {
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    tabbarController.viewControllers = @[[self createMainViewNC], [self createSettingsNC]];
    
    return tabbarController;
}


@end
