// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TIUser.h instead.

#import <CoreData/CoreData.h>

extern const struct TIUserAttributes {
	__unsafe_unretained NSString *login;
	__unsafe_unretained NSString *token;
} TIUserAttributes;

@interface TIUserID : NSManagedObjectID {}
@end

@interface _TIUser : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) TIUserID* objectID;

@property (nonatomic, strong) NSString* login;

//- (BOOL)validateLogin:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* token;

//- (BOOL)validateToken:(id*)value_ error:(NSError**)error_;

@end

@interface _TIUser (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveLogin;
- (void)setPrimitiveLogin:(NSString*)value;

- (NSString*)primitiveToken;
- (void)setPrimitiveToken:(NSString*)value;

@end
