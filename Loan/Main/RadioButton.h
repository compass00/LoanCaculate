

#import <UIKit/UIKit.h>
#define KNOTIFICATION_RADIO_CHECKED_CHANGE @"NotificationChanged"
#define KNOTIFICATION_RADIO_CHECKED_CLICK @"NotificationButtonClick"

#define KEY_TAG @"tag"
#define KEY_CHECKED @"checked"

#define TAG_FIRST_HOURSE    1001
#define TAG_SCOND_HOURSE    1002

#define TAG_FIVE_ONYLE      2002
#define TAG_NOT_TWO_YEARS   2003
#define TAG_TWO_YEARS       2004

@interface RadioButton : UIButton
@property (nonatomic) BOOL checked;
@end

@interface RaidoButtonGroup : NSObject
- (void)addGroup:(RadioButton*)button;
- (void)setChecked:(RadioButton*)button;
@end
