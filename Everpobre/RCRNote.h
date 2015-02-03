#import "_RCRNote.h"

@interface RCRNote : _RCRNote {}

+(instancetype) noteWithName:(NSString*) name
                    notebook:(RCRNotebook*) notebook
                     context:(NSManagedObjectContext*) context;

@end
