//
//  RCRNameCell.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 4/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

@import UIKit;

@interface RCRNameCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *name;

+(NSString *) cellId;
+(CGFloat) cellHeight;

@end
