//
//  RCRNotesViewController.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 4/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
#import "RCRNotebook.h"

@interface RCRNotesViewController : AGTCoreDataTableViewController

@property (nonatomic, strong) RCRNotebook *notebook;

@end
