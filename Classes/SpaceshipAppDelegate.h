//
//  SpaceshipAppDelegate.h
//  Spaceship
//
//  Created by Ryan Cox on 4/16/11.
//  Copyright 2011 Bender Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SplashViewController.h"

@interface SpaceshipAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	SplashViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SplashViewController *viewController;

@end

