//
//  Player.h
//  epicemu
//
//  Created by Jonas Myrlund on 06.04.11.
//  Copyright 2011 Private. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PlayerView.h"

@interface Player : NSObject {
    PlayerView *playerView;
    
    float velocity;
    float lowPassVelocity;
    BOOL followGround;
    
    BOOL isAttacking;
    float timeSpentAttacking;
    float _lengthOfAttacks;
    
    int _state;
}

@property(nonatomic, retain) PlayerView *playerView;
@property(nonatomic) float lengthOfAttacks;
@property(nonatomic) int state;

- (id)initWithPlayerView:(PlayerView *)playerView;
- (void)move:(NSTimeInterval)timeInterval;
- (void)bumpDistance:(float)distance withTimeInterval:(NSTimeInterval)timeInterval;
- (void)flew;

- (BOOL)isOnGround;

- (void)jump;
- (void)attack;
- (void)endAttack;

@end
