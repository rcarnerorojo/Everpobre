//
//  RCRDatesCell.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 4/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRDatesCell.h"

@implementation RCRDatesCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(NSString *) cellId{
    return NSStringFromClass(self);
}

+(CGFloat) cellHeight{
    return 44.0f;
}

@end
