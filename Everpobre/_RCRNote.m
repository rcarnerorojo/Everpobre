// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RCRNote.m instead.

#import "_RCRNote.h"

const struct RCRNoteAttributes RCRNoteAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
	.text = @"text",
};

const struct RCRNoteRelationships RCRNoteRelationships = {
	.notebook = @"notebook",
	.photo = @"photo",
};

@implementation RCRNoteID
@end

@implementation _RCRNote

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Note";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Note" inManagedObjectContext:moc_];
}

- (RCRNoteID*)objectID {
	return (RCRNoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@dynamic text;

@dynamic notebook;

@dynamic photo;

@end

