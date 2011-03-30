//
//  LevelView.m
//  epicemu
//
//  Created by Jonas Myrlund on 30.03.11.
//  Copyright 2011 Private. All rights reserved.
//

#import "LevelView.h"


@implementation LevelView

- (void)awakeFromNib {}

- (void)drawWithPoints:(NSMutableArray *)newPoints {
    // Release existing points
    [controlPoints release];
    
    [controlPoints retain];
    controlPoints = newPoints;
    
    // Call for view to update
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    // Handy thing that may come in handy later
    UIGraphicsGetCurrentContext();
    
    // Start the path
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // Width of drawable area
    unsigned int width = self.frame.size.width;
    unsigned int height = self.frame.size.height;
    
    // Start in the corner
    [path moveToPoint:CGPointMake(0, height)];
    
    // Iterate over resolution, and draw lines between the points
    for (int i = 0; i < [controlPoints count]; i++) {
        unsigned int y = [[controlPoints objectAtIndex:i] unsignedIntValue];
        CGPoint p = CGPointMake((float)i / ([controlPoints count] - 1) * width, y);
        
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

- (void)dealloc
{
    controlPoints = nil;
    
    [super dealloc];
}

@end
