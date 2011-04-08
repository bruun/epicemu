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
    
    // Settings holds level settings
    NSMutableDictionary *settings;
}

@property(nonatomic, retain) LevelView *levelView;
@property(nonatomic, retain) NSMutableDictionary *settings;

- (id)initLevel:(int)levelNumber withLevelView:(LevelView *)levelView;

- (void)update:(NSTimeInterval)timeInterval;
- (void)setNumberOfControlPoints:(unsigned int)n;
- (unsigned int)getNextY;

@end
