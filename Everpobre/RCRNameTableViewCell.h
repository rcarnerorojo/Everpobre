//
//  RCRNameTableViewCell.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import UIKit;

@class RCRNote;

@interface RCRNameTableViewCell : UITableViewCell

+(CGFloat)height;
+(NSString*)cellId;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (nonatomic, strong) RCRNote *note;

@end
