#import "RCRNotebook.h"

@interface RCRNotebook ()

// Private interface goes here.

@end

@implementation RCRNotebook

+(instancetype) notebookWithName:(NSString*) name context:(NSManagedObjectContext*)context{
    
    RCRNotebook *notebook = [self insertInManagedObjectContext:context];
    
    notebook.name = name;
    notebook.creationDate = [NSDate date];
    notebook.modificationDate = [NSDate date];

    return notebook;
}

#pragma mark - Utils

-(NSArray *) observableKeys{

    return @[RCRNotebookAttributes.name,RCRNotebookRelationships.notes];
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
