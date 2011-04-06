//
//  GameViewController.h
//  epicemu
//
//  Created by Håkon Erichsen on 3/23/11.
//  Copyright 2011 Private. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Level.h"

@interface GameViewController : UIViewController {
    Level *level;
    LevelView *levelView;
    
    NSTimer *timer;
}

@property(nonatomic, retain) Level *level;
@property(nonatomic, retain) LevelView *levelView;

- (void)update:(NSTimer *)sender;

@end
