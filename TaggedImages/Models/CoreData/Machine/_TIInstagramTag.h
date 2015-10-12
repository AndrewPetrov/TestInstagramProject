// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TIInstagramTag.h instead.

#import <CoreData/CoreData.h>

extern const struct TIInstagramTagAttributes {
	__unsafe_unretained NSString *tagString;
} TIInstagramTagAttributes;

extern const struct TIInstagramTagRelationships {
	__unsafe_unretained NSString *post;
} TIInstagramTagRelationships;

@class TIInstagramPost;

@interface TIInstagramTagID : NSManagedObjectID {}
@end

@interface _TIInstagramTag : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) TIInstagramTagID* objectID;

@property (nonatomic, strong) NSString* tagString;

//- (BOOL)validateTagString:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *post;

- (NSMutableSet*)postSet;

@end

@interface _TIInstagramTag (PostCoreDataGeneratedAccessors)
- (void)addPost:(NSSet*)value_;
- (void)removePost:(NSSet*)value_;
- (void)addPostObject:(TIInstagramPost*)value_;
- (void)removePostObject:(TIInstagramPost*)value_;

@end

@interface _TIInstagramTag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveTagString;
- (void)setPrimitiveTagString:(NSString*)value;

- (NSMutableSet*)primitivePost;
- (void)setPrimitivePost:(NSMutableSet*)value;

@end
