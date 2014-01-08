@import UIKit;

@interface UIImage (ImageEffects)

- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor colorOpacity:(CGFloat)colorOpacity saturationDeltaFactor:(CGFloat)saturationDeltaFactor blurRadius:(CGFloat)blurRadius;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end
