//
//  RCRPhotoTableViewCell.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRPhotoTableViewCell.h"
#import "RCRNote.h"
#import "RCRPhotoContainer.h"

@implementation RCRPhotoTableViewCell

#pragma mark - Class Methods

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
    
    //sincronizamos los datos de la nota con la vista
    self.photoView.image = note.photo.image;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
