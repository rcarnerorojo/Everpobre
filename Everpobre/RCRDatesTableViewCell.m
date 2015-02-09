//
//  RCRDatesTableViewCell.m
//  Everpobre
//
//  Created by Ramón Carnero Rojo on 5/2/15.
//  Copyright (c) 2015 Ramón Carnero Rojo. All rights reserved.
//

#import "RCRDatesTableViewCell.h"
#import "RCRNote.h"

@implementation RCRDatesTableViewCell

#pragma mark - Class Methods

+(CGFloat)height{
    return 44.0f;
}

+(NSString*)cellId{
    return [self description];
}

#pragma mark - KVO

-(void) setNote:(RCRNote*)note{
    //guardar la nota
    _note = note;
    
    //Observamos modificationDate y cuando cambia la mostramos en la vista
    [self.note addObserver:self
                forKeyPath:RCRNoteAttributes.modificationDate
                   options:0
                   context:NULL];
    
    //mostramos los datos en la vista
    [self syncNoteWithView];
}

-(void) prepareForReuse{
    [super prepareForReuse];
    
    //Hay que darse de baja de las notificaciones de KVO!!!
    [self removeObserver:self forKeyPath:RCRNoteAttributes.modificationDate];
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    //sincronizamos el nuevo valor de modificationDate
    [self syncNoteWithView];
}

#pragma mark - Misc

-(void) syncNoteWithView{
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    //fmt.dateStyle = NSDateFormatterShortStyle;
    [fmt setDateFormat:@"yy-MM-dd HH:mm:ss:SSS"];
    self.creationDate.text = [fmt stringFromDate:self.note.creationDate];
    
    //fmt.dateStyle = NSDateFormatterFullStyle;
    self.modificationDate.text = [fmt stringFromDate:self.note.modificationDate];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
