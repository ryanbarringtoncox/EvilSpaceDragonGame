//
//  SpaceshipViewController.m
//  Spaceship
//
//  Created by Ryan Cox on 4/16/11.
//  Copyright 2011 Bender Productions. All rights reserved.
//

#import "SpaceshipViewController.h"

//Declare constants for game state, velocities
#define kGameStateRunning 1
#define kGameStatePaused  2

#define kBulletSpeedX 0
#define kBulletSpeedY -6

#define kBallSpeedX 3
#define kBallSpeedY 4

#define kFireballSpeedX 3
#define kFireballSpeedY 4

#define kAlienSpeedX 3
#define kAlienSpeedY 0

@implementation SpaceshipViewController
@synthesize tapToBegin, ball, player_score, gameState, ballVelocity, spaceship, alien,
explosion, alienVelocity,fireball, bullet, bulletVelocity;


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if(gameState == kGameStatePaused) {
		//set fireball at alien center
		ball.center = CGPointMake(alien.center.x, alien.center.y);
		tapToBegin.hidden = YES;
		//set visibilities
		spaceship.image = [UIImage imageNamed:@"Spaceship_crop.png"];
		alien.image = [UIImage imageNamed:@"alien.png"];
		ball.image = [UIImage imageNamed:@"Ball.png"];
		bullet.image = [UIImage imageNamed:@"blank.png"];

		gameState = kGameStateRunning;
	} else if(gameState == kGameStateRunning) {
		[self touchesMoved:touches withEvent:event];
	}
}

//Drag after touchdown to move the spaceship to new location
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [[event allTouches] anyObject];
	CGPoint location = [touch locationInView:touch.view];
	CGPoint newLocation = CGPointMake(location.x,location.y);
	spaceship.center = newLocation;
}

//When you lift up on touch the spaceship fires green bullet
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	//set bullet to fire when touch ends
	if (gameState == kGameStateRunning) bullet.image = [UIImage imageNamed:@"bullet.png"];
	bullet.center = CGPointMake(spaceship.center.x, spaceship.center.y);
	//NSLog(@"Touch ended");
}

//Main Gampe Loop
-(void) gameLoop {
	if(gameState == kGameStateRunning) {
		
		//Change position of fireball, alien, bullet slightly according to velocity
		ball.center = CGPointMake(ball.center.x + ballVelocity.x , ball.center.y + ballVelocity.y);
		alien.center = CGPointMake(alien.center.x + alienVelocity.x , alien.center.y + alienVelocity.y);
		bullet.center = CGPointMake(bullet.center.x + bulletVelocity.x , bullet.center.y + bulletVelocity.y);

		//Make the fire ball bounce off border
		if(ball.center.x > self.view.bounds.size.width || ball.center.x < 0) {
			ballVelocity.x = -ballVelocity.x;
		}
		
		if(ball.center.y > self.view.bounds.size.height || ball.center.y < 0) {
			ballVelocity.y = -ballVelocity.y;
		}
		
		if(alien.center.x > self.view.bounds.size.width || alien.center.x < 0) {
			alienVelocity.x = -alienVelocity.x;
		}
		
		if(alien.center.y > self.view.bounds.size.height || alien.center.y < 0) {
			alienVelocity.y = -alienVelocity.y;
		}
		
		//Ru this code if fireball hits spaceship
		//Spaceship becomes explosion and game resets
		if(CGRectIntersectsRect(ball.frame,spaceship.frame)) {
			spaceship.image = [UIImage imageNamed:@"explosionScale.png"];
			ball.image = [UIImage imageNamed:@"blank.png"];
			bullet.image = [UIImage imageNamed:@"blank.png"];
			[self reset:TRUE];
		}
		
		//run this code if green bullet hits alien dragon
		if(CGRectIntersectsRect(bullet.frame, alien.frame)) {
			//reset bullet, make invisible with blank png
			bullet.center = CGPointMake(spaceship.center.x, spaceship.center.y);
			bullet.image = [UIImage imageNamed:@"blank.png"];
			//increment player score and add to text field
			player_score_value++;
			player_score.text = [NSString stringWithFormat:@"%d",player_score_value];
			
			//If spaceship reaches score of five, player wins.  Reset.
			if (player_score_value >= 5) {
				alien.image = [UIImage imageNamed:@"explosionScale.png"];
				[self reset:TRUE];
			}
		}		
		
	} else {
		//Show "touch screen to start new game"
		if(tapToBegin.hidden) {
			tapToBegin.hidden = NO;
		}

   }

}

	-(void)reset:(BOOL) newGame {
		self.gameState = kGameStatePaused;
		//ball.center = self.view.center;
		if(newGame) {
			player_score_value = 0;
		} else {
			player_score_value = 0;
			tapToBegin.text = @"Tap To Begin";
		}
		
		player_score.text = [NSString stringWithFormat:@"%d",player_score_value];
		//computer_score.text = [NSString stringWithFormat:@"%d",computer_score_value];
	}
	
	// After loading basic view, here is additional setup
	- (void)viewDidLoad {
		//inherit
		[super viewDidLoad];
		self.gameState = kGameStatePaused;
		//hide bullet, reset score
		bullet.image = [UIImage imageNamed:@"blank.png"];
		player_score_value = 0;
		player_score.text = [NSString stringWithFormat:@"%d",player_score_value];
		//make velocities
		ballVelocity = CGPointMake(kBallSpeedX,kBallSpeedY);
		bulletVelocity = CGPointMake(kBulletSpeedX,kBulletSpeedY);
		alienVelocity = CGPointMake(kAlienSpeedX,kAlienSpeedY);
		//call game loop every .01 seconds
		[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
	}
	
	- (void)didReceiveMemoryWarning {
		[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
		// Release anything that's not essential, such as cached data
	}
	
	- (void)dealloc {
		[super dealloc];
		[bullet release];
		[explosion release];
		[spaceship release];
		[ball release];
		[fireball release];
		[alien release];
		[player_score release];
		[tapToBegin release];
	}
	
	@end
	
