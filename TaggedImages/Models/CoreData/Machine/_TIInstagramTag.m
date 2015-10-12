// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TIInstagramTag.m instead.

#import "_TIInstagramTag.h"

const struct TIInstagramTagAttributes TIInstagramTagAttributes = {
	.tagString = @"tagString",
};

const struct TIInstagramTagRelationships TIInstagramTagRelationships = {
	.post = @"post",
};

@implementation TIInstagramTagID
@end

@implementation _TIInstagramTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TIInstagramTag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TIInstagramTag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TIInstagramTag" inManagedObjectContext:moc_];
}

- (TIInstagramTagID*)objectID {
	return (TIInstagramTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic tagString;

@dynamic post;

- (NSMutableSet*)postSet {
	[self willAccessValueForKey:@"post"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"post"];

	[self didAccessValueForKey:@"post"];
	return result;
}

@end

