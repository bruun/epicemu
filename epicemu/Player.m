//
//  Player.m
//  epicemu
//
//  Created by Jonas Myrlund on 06.04.11.
//  Copyright 2011 Private. All rights reserved.
//

#import "Player.h"

const double G = 9.81 * 10;

@implementation Player

@synthesize playerView;
@synthesize lengthOfAttacks = _lengthOfAttacks;
@synthesize state = _state;

- (id)initWithPlayerView:(PlayerView *)p {
    self = [super init];
    if (self) {
        self.playerView = p;
        
        velocity = 0.0;
        followGround = YES;
        isAttacking = NO;
        _lengthOfAttacks = 1;
        self.state = P_NORMAL;
    }
    return self;
}

- (void)move:(NSTimer *)sender {
    CGPoint p = [playerView center];
    float s = [sender timeInterval] * velocity;
    [self.playerView setCenter:CGPointMake(p.x, p.y + s)];
    
    double t = [sender timeInterval];
    velocity += 0.5 * G * t;
    
    // Check if done attacking
    if (isAttacking) {
        timeSpentAttacking += [sender timeInterval];
        
        if (timeSpentAttacking > _lengthOfAttacks)
            [self endAttack];
    }
}

- (BOOL)isOnGround {
    return fabs(lowPassVelocity) > 0.1;
}

- (void)flew {
    lowPassVelocity /= 2;
}

- (void)bumpDistance:(float)distance withTimer:(NSTimer *)timer {
    lowPassVelocity = (2 * lowPassVelocity - distance / [timer timeInterval]) / 3;
    if (followGround)
        velocity = 50.0;
    else
        velocity = lowPassVelocity;
}

- (void)jump {
    if ([self isOnGround])
        velocity = -G;
}

- (void)attack {
    if (!isAttacking) {
        isAttacking = YES;
        timeSpentAttacking = 0;
        
        self.state = P_ATTACKING;
    }
}

- (void)endAttack {
    isAttacking = NO;
    timeSpentAttacking = 0;
    
    self.state = P_NORMAL;
}

- (void)setState:(int)state {
    _state = state;
    
    self.playerView.state = _state;
}

@end
