#import <UIKit/UIKit.h>


@interface NewViewController : UIViewController {
	IBOutlet UILabel *label;
	NSString *name;

}
@property (retain)UILabel *label;

-(id)initWithString:(NSString *)string;

@end
