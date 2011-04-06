//
//  Level.h
//  epicemu
//
//  Created by Jonas Myrlund on 30.03.11.
//  Copyright 2011 Private. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LevelView.h"

@interface Level : NSObject {
@private
    // LevelView contains the actual drawing logic
    LevelView *levelView;
    NSMutableArray *controlPoints;
    unsigned int numberOfControlPoints;
    
    // For calculating y-coordinate of next control point
    int tick;
}

@property(nonatomic, retain) LevelView *levelView;

- (id)initWithLevelView:(LevelView *)levelView;

- (void)update:(NSTimer *)timer;
- (void)setNumberOfControlPoints:(unsigned int)n;
- (unsigned int)getNextY;

@end
