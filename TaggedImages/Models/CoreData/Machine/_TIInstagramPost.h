// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to TIInstagramPost.h instead.

#import <CoreData/CoreData.h>

extern const struct TIInstagramPostAttributes {
	__unsafe_unretained NSString *captionText;
	__unsafe_unretained NSString *createdTime;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *pictureURL;
} TIInstagramPostAttributes;

@interface TIInstagramPostID : NSManagedObjectID {}
@end

@interface _TIInstagramPost : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) TIInstagramPostID* objectID;

@property (nonatomic, strong) NSString* captionText;

//- (BOOL)validateCaptionText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* createdTime;

//- (BOOL)validateCreatedTime:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int64_t idValue;
- (int64_t)idValue;
- (void)setIdValue:(int64_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* pictureURL;

//- (BOOL)validatePictureURL:(id*)value_ error:(NSError**)error_;

@end

@interface _TIInstagramPost (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCaptionText;
- (void)setPrimitiveCaptionText:(NSString*)value;

- (NSDate*)primitiveCreatedTime;
- (void)setPrimitiveCreatedTime:(NSDate*)value;

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int64_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int64_t)value_;

- (NSString*)primitivePictureURL;
- (void)setPrimitivePictureURL:(NSString*)value;

@end
