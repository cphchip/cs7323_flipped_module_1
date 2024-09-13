//
//  ImageModel.h
//  flipped_module_1_smith_davis_hendersonExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//
// Revisions:
// Smith,Davis,Henderson: updated for Flipped Assignment 1

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageModel : NSObject

+(ImageModel*)sharedInstance;

-(UIImage*)getImageWithName:(NSString*)name;
-(UIImage*)getImageWithIndex:(NSInteger)index;

//Added
-(NSInteger)numberOfImages;
-(NSString*)getImageNameForIndex:(NSInteger)index;



@end

NS_ASSUME_NONNULL_END
