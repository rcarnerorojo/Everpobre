//
//  RCRTextTableViewCell.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRTextTableViewCell.h"
#import "RCRNote.h"

@implementation RCRTextTableViewCell

+(CGFloat)height{
    return 320.0f;
}

+(NSString*)cellId{
    return [self description];
}


#pragma mark - Properties
-(void) setNote:(RCRNote *)note{
    //Guardamos la nota
    _note = note;
    
    //mostramos el texto en la vista
    self.textView.text = note.text;
}

#pragma mark - Misc
-(void) prepareForReuse{
    
    //guardo lo que haya escrito el usuario en la nota
    self.note.text = self.textView.text;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
