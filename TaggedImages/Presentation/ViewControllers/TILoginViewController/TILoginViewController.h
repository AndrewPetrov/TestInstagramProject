//
//  TILoginViewController.h
//  TaggedImages
//
//  Created by Андрей on 10/7/15.
//  Copyright © 2015 AndrewPetrov. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning зачем нужна эта константа?
extern const NSString* redirect_uri;

#warning <UIWebViewDelegate> можно в *.h не указывать
@interface TILoginViewController : UIViewController<UIWebViewDelegate>

@end
