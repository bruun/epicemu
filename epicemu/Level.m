//
//  Level.m
//  epicemu
//
//  Created by Jonas Myrlund on 30.03.11.
//  Copyright 2011 Private. All rights reserved.
//

#import "Level.h"


@implementation Level


@synthesize path;

- (void)awakeFromNib {
    previousPoints = [[NSMutableArray alloc] init];
    path = [UIBezierPath bezierPath];
}

- (void)update {
    if ([previousPoints count] > 0)
        [previousPoints removeObjectAtIndex:0];
    
    [self setNeedsDisplay];
}

/**
 * Calculates the next Y value to be used.
 */
- (unsigned int)getNextY {
    float h = self.frame.size.height / 4 - 20;
    
    int new = self.frame.size.height;
    new -= (sin(tick * 20 / 90.0f) + 1) * h;
    new -= (sin(tick * 8 / 90.0f) + 1) * h;
    // new -= arc4random() % (int)h / 5;
    
    new -= 20;
    
    if ([previousPoints count] == 0)
        return new;
    
    // Eventually perform an N low-pass filter to generate next value
    int degree = 10;
    
    float total = new;
    
    int from = [previousPoints count] - degree;
    if (from < 0) from = 0;
    
    int count = 1;
    
    for (int i = from; i < [previousPoints count]; i++) {
        total += [[previousPoints objectAtIndex:i] unsignedIntValue];
        count++;
    }
    return total / count;
}

- (void)drawRect:(CGRect)rect
{
    // Add missing points, if any
    while ([previousPoints count] < numberOfControlPoints) {
        // Increase the tick used for
        tick++;
        
        // Add the point
        unsigned int y = [self getNextY];
        [previousPoints addObject:[NSNumber numberWithUnsignedInt:y]];
    }
    
    // Handy thing that may come in handy later
    UIGraphicsGetCurrentContext();
    
    // Start the path
    path = [[UIBezierPath alloc] init];
    
    // Width of drawable area
    unsigned int width = self.frame.size.width;
    unsigned int height = self.frame.size.height;
    
    // Start in the corner
    [path moveToPoint:CGPointMake(0, height)];
    
    // Iterate over resolution, and draw lines between the points
    for (int i = 0; i < numberOfControlPoints; i++) {
        unsigned int y = [[previousPoints objectAtIndex:i] unsignedIntValue];
        CGPoint p = CGPointMake((float)i / (numberOfControlPoints - 1) * width, y);
        
        [path addLineToPoint:p];
    }
    
    // Finish the path
    [path addLineToPoint:CGPointMake(width, height)];
    [path closePath];
    
    // Fill and stroke
    [[UIColor colorWithRed:0.1 green:0.7 blue:0.1 alpha:1.0] setFill];
    [[UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0] setStroke];
    
    path.lineWidth = 3;
    [path fill];
    [path stroke];
}

- (void)setNumberOfControlPoints:(unsigned int)n {
    numberOfControlPoints = n;
}

- (void)dealloc
{
    path = nil;
    previousPoints = nil;
    
    [super dealloc];
}

@end
