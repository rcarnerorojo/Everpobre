//
//  RCRNotebookTableViewCell.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRNotebookTableViewCell.h"

@implementation RCRNotebookTableViewCell

+(CGFloat)height{
    return 60.0f;
}

+(NSString*)cellId{
    return [self description];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
