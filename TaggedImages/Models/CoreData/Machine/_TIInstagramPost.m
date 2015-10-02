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

	return keyPaths;
}

@dynamic captionText;

@dynamic createdTime;

@dynamic id;

@dynamic pictureURL;

@end

