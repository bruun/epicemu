//
//  PlayerView.m
//  epicemu
//
//  Created by Jonas Myrlund on 30.03.11.
//  Copyright 2011 Private. All rights reserved.
//

#import "PlayerView.h"


@implementation PlayerView

@synthesize state = _state;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _state = P_NORMAL;
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // For now, draw a ball
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    
    if (_state == P_NORMAL) {
        [[UIColor greenColor] setFill];
    }
    else if (_state == P_ATTACKING) {
        [[UIColor redColor] setFill];
    }
    
    [oval fill];
}

/**
 * Redraw if state changes
 */
- (void)setState:(int)s {
    _state = s;
    
    [self setNeedsDisplay];
}

- (void)dealloc
{
    [super dealloc];
}

@end
