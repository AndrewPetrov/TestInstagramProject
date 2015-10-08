//
//  TICollectionViewCell.h
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TIInstagramPost;

@interface TICollectionViewCell : UICollectionViewCell

- (void)setPost:(TIInstagramPost *)post;

@end
