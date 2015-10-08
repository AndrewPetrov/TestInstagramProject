//
//  TICollectionViewCell.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TICollectionViewCell.h"
#import "TIInstagramPost.h"
#import "UIImage+TaggedImages.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TICollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *postImageView;

@end

@implementation TICollectionViewCell

- (void)setPost:(TIInstagramPost *)post {
    
    if (!post) {
        self.postImageView.image = [UIImage stubPostCellImage];
    }
    else {
        [self.postImageView sd_setImageWithURL:[NSURL URLWithString:post.pictureURL]
                              placeholderImage:[UIImage loadingPostCellImage]];
    }
}

@end

