//
//  SpaceshipViewController.h
//  Spaceship
//
//  Created by Ryan Cox on 4/16/11.
//  Copyright 2011 Bender Productions. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SpaceshipViewController : UIViewController {
	IBOutlet UIImageView *ball;
	IBOutlet UIImageView *fireball;
	IBOutlet UIImageView *alien;
	IBOutlet UIImageView *spaceship;
	IBOutlet UILabel *tapToBegin;
	IBOutlet UILabel *player_score;
	IBOutlet UIImageView *explosion;
	
	CGPoint bulletVelocity;
	CGPoint ballVelocity;
	CGPoint fireballVelocity;
	CGPoint alienVelocity;
	NSInteger gameState;
	NSInteger player_score_value;
}

@property(nonatomic,retain) IBOutlet UIImageView *ball;
@property(nonatomic,retain) IBOutlet UIImageView *bullet;
@property(nonatomic,retain) IBOutlet UIImageView *fireball;
@property(nonatomic,retain) IBOutlet UIImageView *alien;
@property(nonatomic,retain) IBOutlet UIImageView *spaceship;
@property(nonatomic,retain) IBOutlet UILabel *tapToBegin;
@property(nonatomic,retain) IBOutlet UILabel *player_score;
@property(nonatomic,retain) IBOutlet UIImageView *explosion;

@property(nonatomic) NSInteger gameState;
@property(nonatomic) CGPoint ballVelocity;
@property(nonatomic) CGPoint alienVelocity;
@property(nonatomic) CGPoint bulletVelocity;


-(void)reset:(BOOL) newGame;

@end

