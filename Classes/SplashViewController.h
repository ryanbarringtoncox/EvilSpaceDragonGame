//
//  SplashViewController.h
//  Spaceship Game
//  R Cox

#import <UIKit/UIKit.h>
#import "SpaceshipViewController.h"

@interface SplashViewController : UIViewController {
	NSTimer *timer;
	UIImageView *splashImageView;
	
	SpaceshipViewController *viewController;
}

@property(nonatomic,retain) NSTimer *timer;
@property(nonatomic,retain) UIImageView *splashImageView;
@property(nonatomic,retain) SpaceshipViewController *viewController;

@end
