//
//  RCRNoteViewController.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import UIKit;

@class RCRNote;
@interface RCRNoteViewController : UITableViewController

@property (nonatomic, strong) RCRNote *note;

-(id) initWithModel:(RCRNote*) model;

@end
