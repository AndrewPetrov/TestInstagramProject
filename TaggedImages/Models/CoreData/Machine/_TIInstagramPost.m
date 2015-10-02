// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TIInstagramPost.m instead.

#import "_TIInstagramPost.h"

const struct TIInstagramPostAttributes TIInstagramPostAttributes = {
	.captionText = @"captionText",
	.createdTime = @"createdTime",
	.id = @"id",
	.pictureURL = @"pictureURL",
};

@implementation TIInstagramPostID
@end

@implementation _TIInstagramPost

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TIInstagramPost" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TIInstagramPost";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TIInstagramPost" inManagedObjectContext:moc_];
}

- (TIInstagramPostID*)objectID {
	return (TIInstagramPostID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic captionText;

@dynamic createdTime;

@dynamic id;

- (int64_t)idValue {
	NSNumber *result = [self id];
	return [result longLongValue];
}

- (void)setIdValue:(int64_t)value_ {
	[self setId:[NSNumber numberWithLongLong:value_]];
}

- (int64_t)primitiveIdValue {
	NSNumber *result = [self primitiveId];
	return [result longLongValue];
}

- (void)setPrimitiveIdValue:(int64_t)value_ {
	[self setPrimitiveId:[NSNumber numberWithLongLong:value_]];
}

@dynamic pictureURL;

@end

