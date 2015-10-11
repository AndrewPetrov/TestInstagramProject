// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TIInstagramPostsPaginationIDs.m instead.

#import "_TIInstagramPostsPaginationIDs.h"

const struct TIInstagramPostsPaginationIDsAttributes TIInstagramPostsPaginationIDsAttributes = {
	.min_tag_id = @"min_tag_id",
	.next_max_tag_id = @"next_max_tag_id",
	.next_url = @"next_url",
};

@implementation TIInstagramPostsPaginationIDsID
@end

@implementation _TIInstagramPostsPaginationIDs

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TIInstagramPostsPaginationIDs" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TIInstagramPostsPaginationIDs";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TIInstagramPostsPaginationIDs" inManagedObjectContext:moc_];
}

- (TIInstagramPostsPaginationIDsID*)objectID {
	return (TIInstagramPostsPaginationIDsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic min_tag_id;

@dynamic next_max_tag_id;

@dynamic next_url;

@end

