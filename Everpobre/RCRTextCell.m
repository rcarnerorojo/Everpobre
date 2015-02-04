//
//  RCRTextCell.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 4/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRTextCell.h"

@implementation RCRTextCell

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
    return 200.0f;
}

@end
