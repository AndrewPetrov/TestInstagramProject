// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TIInstagramPostsPaginationIDs.h instead.

#import <CoreData/CoreData.h>

extern const struct TIInstagramPostsPaginationIDsAttributes {
	__unsafe_unretained NSString *min_tag_id;
	__unsafe_unretained NSString *next_max_tag_id;
	__unsafe_unretained NSString *next_url;
} TIInstagramPostsPaginationIDsAttributes;

@interface TIInstagramPostsPaginationIDsID : NSManagedObjectID {}
@end

@interface _TIInstagramPostsPaginationIDs : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) TIInstagramPostsPaginationIDsID* objectID;

@property (nonatomic, strong) NSString* min_tag_id;

//- (BOOL)validateMin_tag_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* next_max_tag_id;

//- (BOOL)validateNext_max_tag_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* next_url;

//- (BOOL)validateNext_url:(id*)value_ error:(NSError**)error_;

@end

@interface _TIInstagramPostsPaginationIDs (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveMin_tag_id;
- (void)setPrimitiveMin_tag_id:(NSString*)value;

- (NSString*)primitiveNext_max_tag_id;
- (void)setPrimitiveNext_max_tag_id:(NSString*)value;

- (NSString*)primitiveNext_url;
- (void)setPrimitiveNext_url:(NSString*)value;

@end
