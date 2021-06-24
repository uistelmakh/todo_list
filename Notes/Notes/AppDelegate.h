//
//  AppDelegate.h
//  Notes
//
//  Created by Sergey Stelmakh on 20.06.2021.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UIWindow * window;
@end

