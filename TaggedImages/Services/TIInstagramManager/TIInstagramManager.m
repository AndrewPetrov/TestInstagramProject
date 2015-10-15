//
//  TIInstagramManager.m
//
//
//  Created by Андрей on 10/1/15.
//
//

//#warning здесь достаточно много лишних импортов. Удалите лишние
#import "TIInstagramManager.h"
#import <MagicalRecord.h>
#import "TIInstagramMapingManager.h"
#import "TIUser.h"
#import "TIInstagramPostsPaginationInfo.h"
#import "TIServicesConstants.h"
#import "TIInstagramAPIClient.h"

@implementation TIInstagramManager

+ (NSURLRequest *)userAuthorizationRequest {
    return [TIInstagramAPIClient instagramUserAuthorizationRequest];
}

+ (void)saveTokenFromRedirectUriRequest:(NSURLRequest *)request {   
    NSArray *urlParams = [request.URL.fragment componentsSeparatedByString:@"="];
    NSString *token = urlParams[[urlParams indexOfObject:TIInstagramTokenKey] + 1];
    TIUser *user = [TIUser MR_createEntity];
    user.token = token;
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

+ (void)requestRecentPostWithTag:(NSString *)tag
                  paginationInfo:(TIInstagramPostsPaginationInfo *)paginationInfo
                 complitionBlock:(TICompletionBlock) completionBlock {
    
    //#warning в принципе подход с оберткой вокруг AFHTTPRequestOperation (TIInstagramRequest) имеет право существовать. Обычно вмето связки фабрика -> обертка создается класс APIClient, у которого есть метод, скажем, "загрузить посты с такими-то параметрами, successBlock'ом и failureBlock'ом", внутри метода создается операция, которой подставляются это блоки. Так уровень API остается спрятаным от менеджеров
    
    void (^requestCompletionBlock)(NSDictionary *, NSError *) = ^(NSDictionary *results, NSError *error) {
        TIInstagramPostsPaginationInfo *paginationInfoResult = [TIInstagramMapingManager mapPaginationInfoFromJSONDictionary:results[TIInstagramPaginationKey]];
        [TIInstagramMapingManager mapPostsFromJSONArray:results[TIInstagramDataKey] withRequestedTag:tag];
        
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        completionBlock(paginationInfoResult, nil);
    };
    [TIInstagramAPIClient fetchInstagramRecentPostsRequestWithTag:tag
                                                   paginationInfo:paginationInfo
                                                  complitionBlock:requestCompletionBlock
                                                     failureBlock:nil];
}

@end