//
//  LevelButton.h
//  epicemu
//
//  Created by Håkon Erichsen on 4/6/11.
//  Copyright 2011 Private. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootViewController.h"

@interface LevelButton : UILabel {
    int level;
    bool locked;
    
    RootViewController *root;
}

-(id) initWithValue: (int)value andRoot:(RootViewController *)root;

@property(nonatomic) int level;
@property(nonatomic) bool locked;
@property(nonatomic, retain) RootViewController *root;

@end
