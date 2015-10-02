// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TIUser.m instead.

#import "_TIUser.h"

const struct TIUserAttributes TIUserAttributes = {
	.login = @"login",
	.token = @"token",
};

@implementation TIUserID
@end

@implementation _TIUser

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"TIUser" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"TIUser";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"TIUser" inManagedObjectContext:moc_];
}

- (TIUserID*)objectID {
	return (TIUserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic login;

@dynamic token;

@end

