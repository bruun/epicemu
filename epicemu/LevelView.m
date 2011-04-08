//
//  LevelView.m
//  epicemu
//
//  Created by Jonas Myrlund on 30.03.11.
//  Copyright 2011 Private. All rights reserved.
//

#import "LevelView.h"

@implementation LevelView

@synthesize path = _path;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawWithPoints:(NSMutableArray *)newPoints {
    // Release existing points
    controlPoints = newPoints;
    
    // Call for view to update
    [self performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:nil waitUntilDone:NO];
}

- (void)drawRect:(CGRect)rect
{
    // Get current drawing context and clear the screen
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClearRect(ctx, rect);
    
    // Start the path
    self.path = [UIBezierPath bezierPath];
    UIBezierPath *path = self.path;
    
    // Width of drawable area
    unsigned int width = self.frame.size.width;
    unsigned int height = self.frame.size.height;
    
    // Start in the corner
    [path moveToPoint:CGPointMake(0, height)];
    
    // Iterate over resolution, and draw lines between the points
    unsigned int prev, next;
    float dx = (float)width / ([controlPoints count] - 1);
    for (int i = 0; i < [controlPoints count]; i++) {
        // Get current y and assume previous and next point the same (edge cases)
        unsigned int y = [[controlPoints objectAtIndex:i] unsignedIntValue];
        prev = next = y;
        
        // Get actual previous and next control points
        if (i > 0)
            prev = [[controlPoints objectAtIndex:i-1] unsignedIntValue];
        if (i < [controlPoints count] - 1)
            next = [[controlPoints objectAtIndex:i+1] unsignedIntValue];
        
        // Ascension rate
        int a = next - prev;
        
        float x = i * dx;
        
        CGPoint p = CGPointMake(x, y);
        CGPoint c1 = CGPointMake(x - dx / 3, y - a / 2);
        CGPoint c2 = CGPointMake(x + dx / 3, y + a / 2);
        
        if (i > 0 && i < [controlPoints count] - 1)
            [path addCurveToPoint:p controlPoint1:c1 controlPoint2:c2];
        else
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
