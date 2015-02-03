// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RCRPhotoContainer.h instead.

@import CoreData;
#import "RCRBaseObject.h"

extern const struct RCRPhotoContainerAttributes {
	__unsafe_unretained NSString *photoData;
} RCRPhotoContainerAttributes;

extern const struct RCRPhotoContainerRelationships {
	__unsafe_unretained NSString *notes;
} RCRPhotoContainerRelationships;

@class RCRNote;

@interface RCRPhotoContainerID : NSManagedObjectID {}
@end

@interface _RCRPhotoContainer : RCRBaseObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) RCRPhotoContainerID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _RCRPhotoContainer (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(RCRNote*)value_;
- (void)removeNotesObject:(RCRNote*)value_;

@end

@interface _RCRPhotoContainer (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
