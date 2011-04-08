//
//  LevelButton.h
//  epicemu
//
//  Created by Håkon Erichsen on 4/6/11.
//  Copyright 2011 Private. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RootViewController.h"

@interface LevelButton : UIButton {
    int level;
    bool locked;
    

}

-(id) initWithValue: (int)value;

@property(nonatomic) int level;
@property(nonatomic) bool locked;

@end
