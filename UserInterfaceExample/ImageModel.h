//
//  ImageModel.h
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//
//  Modified by: Ches Smith

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageModel : NSObject

+(ImageModel*)sharedInstance;
-(UIImage* _Nullable)getImageWithName:(NSString*)name;
-(UIImage* _Nullable)getImageWithIndex:(NSInteger)index;
-(NSInteger)numberOfImages;
-(NSString* _Nullable)getImageNameForIndex:(NSInteger)index;


@end

NS_ASSUME_NONNULL_END
