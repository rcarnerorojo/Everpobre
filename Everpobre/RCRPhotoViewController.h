//
//  RCRPhotoViewController.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import UIKit;
@class RCRNote;

@interface RCRPhotoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

- (IBAction)takePhoto:(id)sender;
- (IBAction)deletePhoto:(id)sender;

-(id) initWithModel:(RCRNote*) model;

@end
