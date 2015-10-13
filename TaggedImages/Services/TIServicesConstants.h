//
//  TIServicesConstants.h
//  TaggedImages
//
//  Created by Андрей on 10/13/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#ifndef TIServicesConstants_h
#define TIServicesConstants_h

static NSInteger const TITaggedPostsPageSize = 33;
static NSInteger const TIPostsCountLoadingHandicap = 6;

static NSString * const TIInstagramAuthorizationRequestString =
@"https://api.instagram.com/oauth/authorize/?client_id=482b2956910b48ef9f33157622977803&"
"redirect_uri=%@&response_type=token";
static NSString * const TIInstagramPostsRequestString =
@"https://api.instagram.com/v1/tags/%@/media/recent?access_token=%@&count=%ld";
static NSString * const TITaggedimageRedirectString = @"taggedimage://redirect.com";

static NSString * const TIInstagramTokenKey = @"access_token";
static NSString * const TIInstagramPaginationKey = @"pagination";
static NSString * const TIInstagramDataKey = @"data";

#endif /* TIServicesConstants_h */
