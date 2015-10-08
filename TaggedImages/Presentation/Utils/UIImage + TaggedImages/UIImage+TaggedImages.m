//
//  UIImage+TaggedImages.m
//  TaggedImages
//
//  Created by Андрей on 10/8/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import "UIImage+TaggedImages.h"

@implementation UIImage (TaggedImages)

+ (UIImage *)stubPostCellImage {
    return [UIImage imageNamed:@"No_image_available"];
}

+ (UIImage *)tableImage {
    return [UIImage imageNamed:@"list-simple-7"];
}

+ (UIImage *)collectionImage {
    return [UIImage imageNamed:@"square-individual-nine-7"];
}


@end
