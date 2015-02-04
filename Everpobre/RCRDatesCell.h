//
//  RCRDatesCell.h
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 4/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCRDatesCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateCreation;

@property (weak, nonatomic) IBOutlet UILabel *dateModification;

+(NSString *) cellId;
+(CGFloat) cellHeight;

@end
