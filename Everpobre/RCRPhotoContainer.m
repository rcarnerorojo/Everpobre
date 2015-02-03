#import "RCRPhotoContainer.h"

@interface RCRPhotoContainer ()

// Private interface goes here.

@end

@implementation RCRPhotoContainer

-(UIImage*)image{
    
    return [UIImage imageWithData:self.photoData];
}

-(void) setImage:(UIImage *)image{
    
    self.photoData = UIImageJPEGRepresentation(image, 0.9);
}

@end
