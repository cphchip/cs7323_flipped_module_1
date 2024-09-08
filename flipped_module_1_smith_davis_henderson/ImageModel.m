//
//  ImageModel.m
//  flipped_module_1_smith_davis_hendersonExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//
// Revisions:
// Wilma Davis: updated for Flipped Assignment 1


#import "ImageModel.h"
// Wilma added:  make properties private
@interface ImageModel()
@property (strong, nonatomic) NSArray* imageNames;
@property (strong, nonatomic) NSMutableDictionary* imageDict;
@end

@implementation ImageModel
@synthesize imageNames = _imageNames;
@synthesize imageDict = _imageDict;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

//UPDATED by Wilma
-(NSArray*) imageNames{
    if(!_imageNames){
        _imageNames = @[@"Bill",@"Eric",@"Jeff",@"SMU campus",@"SMU Caruth Hall",@"SMU Logo"];
        
        _imageDict = [[NSMutableDictionary alloc] init];
        
        for (int i=0; i<[_imageNames count]; i++){
            NSString *key   = _imageNames[i];
            UIImage  *value = [UIImage imageNamed:key];
            
            [_imageDict setObject:value forKey:key];
        }
    }
    return _imageNames;
}


//code implementations added by WIlma

//NEW
-(NSInteger)numberOfImages {
    NSInteger num=0;
    
    num = [self.imageNames count];
    
    return num;
}

//NEW
-(NSString*)getImageNameForIndex:(NSInteger)index{
    NSString* image_name = nil;
    
    image_name = self.imageNames[index];
    
    return image_name;
}

-(UIImage*)getImageWithName:(NSString*)name{
    UIImage* image = nil;
    
    //Updated by Wilma: get image from Dictionary
    //image = [UIImage imageNamed:name];
    
    image = [_imageDict objectForKey:name];
    
    return image;
}



@end
