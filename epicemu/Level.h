//
//  Level.h
//  epicemu
//
//  Created by Jonas Myrlund on 30.03.11.
//  Copyright 2011 Private. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Level : UIView {
@private
    UIBezierPath *path;
    NSMutableArray *previousPoints;
    unsigned int numberOfControlPoints;
    int tick;
}

@property(nonatomic, retain) UIBezierPath *path;

- (void)update;
- (void)setNumberOfControlPoints:(unsigned int)n;
- (unsigned int)getNextY;

@end
