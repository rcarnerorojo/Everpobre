//
//  RCRNoteViewController.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 4/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"

@class RCRNote;

@interface RCRNoteViewController : AGTCoreDataTableViewController

@property (strong,nonatomic) RCRNote *note;

-(id) initWithNote:(RCRNote*)note;

@end
