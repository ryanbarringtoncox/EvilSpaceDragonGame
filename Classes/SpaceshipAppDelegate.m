//
//  SpaceshipAppDelegate.m
//  Spaceship
//
//  Created by Ryan Cox on 4/16/11.
//  Copyright 2011 Bender Productions. All rights reserved.
//

#import "SpaceshipAppDelegate.h"

@implementation SpaceshipAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
	viewController = [[SplashViewController alloc] init];
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
