#import "RCRNote.h"
#import "RCRPhotoContainer.h"

@interface RCRNote ()

// Private interface goes here.

@end

@implementation RCRNote

+(instancetype) noteWithName:(NSString*) name
                    notebook:(RCRNotebook*) notebook
                     context:(NSManagedObjectContext*) context{
    
    //insertInManagedObjectContext lo crea Mogenerator
    RCRNote *note = [self insertInManagedObjectContext:context];
    
    note.name = name;
    note.notebook = notebook;
    note.creationDate = [NSDate date];
    note.photo = [RCRPhotoContainer insertInManagedObjectContext:context];
    note.modificationDate = [NSDate date];
    
    return note;
}

#pragma mark - Utils

-(NSArray *) observableKeys{
    
    return @[RCRNoteAttributes.name,
             RCRNoteAttributes.text,
             RCRNoteRelationships.notebook,
             RCRNoteRelationships.photo,
             @"photo.photoData"];//@"photo.photoData" porque no tenemos propiedad
}

#pragma mark - KVO

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    //sólo me interesa saber que algo ha cambiado
    self.modificationDate = [NSDate date];
}

@end
