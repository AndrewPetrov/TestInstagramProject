//
//  TITableViewCell.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "TITableViewCell.h"
#import "TIInstagramPost.h"
#import "UIImage+TaggedImages.h"


@interface TITableViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *postImageView;
@property (nonatomic, weak) IBOutlet UITextView *descriptionTextView;

@end


@implementation TITableViewCell

- (void)setPost:(TIInstagramPost *)post {
    
    if (!post) {
        self.postImageView.image = [UIImage stubPostCellImage];
    }
    else {
        self.descriptionTextView.text = post.captionText;
        self.postImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:post.pictureURL]]];
    }
}

@end

