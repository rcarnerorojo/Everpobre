// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RCRPhotoContainer.m instead.

#import "_RCRPhotoContainer.h"

const struct RCRPhotoContainerAttributes RCRPhotoContainerAttributes = {
	.photoData = @"photoData",
};

const struct RCRPhotoContainerRelationships RCRPhotoContainerRelationships = {
	.notes = @"notes",
};

@implementation RCRPhotoContainerID
@end

@implementation _RCRPhotoContainer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhotoContainer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

- (RCRPhotoContainerID*)objectID {
	return (RCRPhotoContainerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

