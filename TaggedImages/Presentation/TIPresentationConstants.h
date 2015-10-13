//
//  TIPresentationConstants.h
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#ifndef TIPresentationConstants_h
#define TIPresentationConstants_h

static NSString * const TITableViewCellIdentifier = @"TITableViewCellIdentifier";
static NSString * const TICollectionViewCellIdentifier = @"TICollectionViewCellIdentifier";
static NSString * const TITableViewControllerIdentifier = @"TITableViewControllerIdentifier";
static NSString * const TICollectionViewControllerIdentifier = @"TICollectionViewControllerIdentifier";
static NSString * const TITagViewControllerIdentifier = @"TITagViewControllerIdentifier";
static NSString * const TIContainerControllerIdentifier = @"TIContainerControllerIdentifier";

static NSInteger const TITaggedPostsPageSize = 30;
static NSInteger const TIPostsCountLoadingHandicap = 3;

static NSString * const TIInstagramAuthorizationRequestString =
    @"https://api.instagram.com/oauth/authorize/?client_id=482b2956910b48ef9f33157622977803&"
    "redirect_uri=%@&response_type=token";
static NSString * const TIInstagramPostsRequestString =
@"https://api.instagram.com/v1/tags/%@/media/recent?access_token=%@&count=%ld";
static NSString * const TITaggedimageRedirectString = @"taggedimage://redirect.com";

static NSString * const TIInstagramTokenKey = @"access_token";
static NSString * const TIInstagramPaginationKey = @"pagination";
static NSString * const TIInstagramDataKey = @"data";

#endif /* TIPresentationConstants_h */
