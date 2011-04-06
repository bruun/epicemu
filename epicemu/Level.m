//
//  Level.m
//  epicemu
//
//  Created by Jonas Myrlund on 30.03.11.
//  Copyright 2011 Private. All rights reserved.
//

#import "Level.h"


@implementation Level

@synthesize levelView;

- (id)initWithLevelView:(LevelView *)lv {
    self = [super init];
    if (self) {
        numberOfControlPoints = 50;
        controlPoints = [[NSMutableArray alloc] init];
        self.levelView = lv;
    }
    return self;
}

- (void)update:(NSTimer *)timer {
    
    // Remove excessive previous points
    while ([controlPoints count] >= numberOfControlPoints)
        [controlPoints removeObjectAtIndex:0];
    
    // Add missing points, if any
    while ([controlPoints count] < numberOfControlPoints) {
        // Increase the tick used for
        tick++;
        
        // Add the point
        unsigned int y = [self getNextY];
        [controlPoints addObject:[NSNumber numberWithUnsignedInt:y]];
    }
    
    // Call for view to update
    [levelView drawWithPoints:controlPoints];
    
}

/**
 * Calculates the next Y value to be used.
 */
- (unsigned int)getNextY {
    float height = self.levelView.bounds.size.height;
    float h = height / 4 - 20;
    
    int new = height;
    new -= (sin(tick * 20 / 90.0f) + 1) * h;
    new -= (sin(tick * 8 / 90.0f) + 1) * h;
    new -= arc4random() % (int)h / 5;
    
    new += 50;
    
    if ([controlPoints count] == 0)
        return new;
    
    // Eventually perform an N low-pass filter to generate next value
    int degree = 10;
    
    float total = new;
    
    int from = [controlPoints count] - degree;
    if (from < 0) from = 0;
    
    // Perform the low-pass filtering
    int count = 1;
    for (int i = from; i < [controlPoints count]; i++) {
        total += [[controlPoints objectAtIndex:i] unsignedIntValue];
        count++;
    }
    return total / count;
}

- (void)setNumberOfControlPoints:(unsigned int)n {
    numberOfControlPoints = n;
}

- (void)dealloc
{
    controlPoints = nil;
    
    [super dealloc];
}

@end
