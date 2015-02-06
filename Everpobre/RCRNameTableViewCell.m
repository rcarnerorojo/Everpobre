//
//  RCRNameTableViewCell.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRNameTableViewCell.h"
#import "RCRNote.h"

@interface RCRNameTableViewCell ()

@end

@implementation RCRNameTableViewCell

#pragma mark - Properties

//sobreescribimos el setter
-(void) setNote:(RCRNote *)note{
    
    //sincronizamos la vista con la nota
    self.nameField.text = note.name;
    
    //guardamos la nota
    _note = note;
}


#pragma mark - ClassMethods

+(CGFloat)height{
    return 44.0f;
}

+(NSString*)cellId{
    return [self description];
}

#pragma mark - Misc

-(void) prepareForReuse{
    [super prepareForReuse];
    //Cuando desaparezco, me mandan este mensaje para que me resetee y me prepare para ser reutilizado.
    //Algo así como un viewWillDissappear para celdas
    
    self.note.name = self.nameField.text;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
