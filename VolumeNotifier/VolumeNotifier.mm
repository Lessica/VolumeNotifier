#line 1 "/Users/Zheng/Projects/VolumeNotifier/VolumeNotifier/VolumeNotifier.xm"
#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <SpringBoard/SpringBoard.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <SndDelegate.h>
#import <VolumeNotifier.h>

#define DEFAULT_ENABLED YES
#define PREFS_ENABLED_KEY @"mainSwitch"

#define DEFAULT_ENABLED_WHEN_PLAYING YES
#define PREFS_ENABLED_WHEN_PLAYING_KEY @"enableWhenPlaying"

#define DEFAULT_ENABLED_IN_CC YES
#define PREFS_ENABLED_IN_CC_KEY @"enableCC"

#define DEFAULT_BLOCK_HUD NO
#define PREFS_BLOCK_HUD_KEY @"blockHUD"

#define DEFAULT_VIB_ENABLED NO
#define PREFS_VIB_ENABLED_KEY @"enableVib"

#define DEFAULT_FLASH_ENABLED NO
#define PREFS_FLASH_ENABLED_KEY @"enableFlash"

#define DEFAULT_SOUND_NAME @""
#define PREFS_SOUND_NAME_KEY @"soundName"

#define DEFAULT_SOUND_CHOICE 1
#define PREFS_SOUND_CHOICE_KEY @"built-in"

#define DEFAULT_SOUND_A @"/System/Library/Audio/UISounds/VolumeNotifier/volume.aiff"
#define DEFAULT_SOUND_B @"/System/Library/Audio/UISounds/VolumeNotifier/beep.caf"
#define DEFAULT_SOUND_C @"/System/Library/Audio/UISounds/VolumeNotifier/tink.aiff"
#define DEFAULT_SOUND_D @"/System/Library/Audio/UISounds/VolumeNotifier/morse.aiff"
#define DEFAULT_SOUND_E @"/System/Library/Audio/UISounds/VolumeNotifier/ping.aiff"
#define DEFAULT_SOUND_F @"/System/Library/Audio/UISounds/VolumeNotifier/pop.aiff"
#define DEFAULT_SOUND_G @"/System/Library/Audio/UISounds/VolumeNotifier/mavericks.aiff"

#define MAIN_ENABLED ([preferences objectForKey: PREFS_ENABLED_KEY] ? [[preferences objectForKey: PREFS_ENABLED_KEY] boolValue] : DEFAULT_ENABLED)

#define MAIN_ENABLED_WHEN_PLAYING ([preferences objectForKey: PREFS_ENABLED_WHEN_PLAYING_KEY] ? [[preferences objectForKey: PREFS_ENABLED_WHEN_PLAYING_KEY] boolValue] : DEFAULT_ENABLED_WHEN_PLAYING)

#define MAIN_CC_ENABLED ([preferences objectForKey: PREFS_ENABLED_IN_CC_KEY] ? [[preferences objectForKey: PREFS_ENABLED_IN_CC_KEY] boolValue] : DEFAULT_ENABLED_IN_CC)

#define MAIN_BLOCK_HUD ([preferences objectForKey: PREFS_BLOCK_HUD_KEY] ? [[preferences objectForKey: PREFS_BLOCK_HUD_KEY] boolValue] : DEFAULT_BLOCK_HUD)

#define MAIN_VIB_ENABLED ([preferences objectForKey: PREFS_VIB_ENABLED_KEY] ? [[preferences objectForKey: PREFS_VIB_ENABLED_KEY] boolValue] : DEFAULT_VIB_ENABLED)

#define MAIN_FLASH_ENABLED ([preferences objectForKey: PREFS_FLASH_ENABLED_KEY] ? [[preferences objectForKey: PREFS_FLASH_ENABLED_KEY] boolValue] : DEFAULT_FLASH_ENABLED)

#define MAIN_SOUND_NAME ([preferences objectForKey: PREFS_SOUND_NAME_KEY] ? [preferences objectForKey: PREFS_SOUND_NAME_KEY] : DEFAULT_SOUND_NAME)

#define MAIN_PATH [NSString stringWithFormat:@"/System/Library/Audio/UISounds/VolumeNotifier/%@", MAIN_SOUND_NAME]

#define MAIN_SOUND_CHOICE ([preferences objectForKey: PREFS_SOUND_CHOICE_KEY] ? [[preferences objectForKey: PREFS_SOUND_CHOICE_KEY] intValue] : DEFAULT_SOUND_CHOICE)

#include <logos/logos.h>
#include <substrate.h>
@class VolumeControl; @class MPUMediaControlsVolumeView; @class SBCCFlashlightSetting; @class SBMediaController; @class SBBannerController; 
static void (*_logos_orig$_ungrouped$VolumeControl$setVolume$)(VolumeControl*, SEL, float); static void _logos_method$_ungrouped$VolumeControl$setVolume$(VolumeControl*, SEL, float); static void (*_logos_orig$_ungrouped$VolumeControl$increaseVolume)(VolumeControl*, SEL); static void _logos_method$_ungrouped$VolumeControl$increaseVolume(VolumeControl*, SEL); static void (*_logos_orig$_ungrouped$VolumeControl$decreaseVolume)(VolumeControl*, SEL); static void _logos_method$_ungrouped$VolumeControl$decreaseVolume(VolumeControl*, SEL); static void (*_logos_orig$_ungrouped$VolumeControl$_presentVolumeHUDWithMode$volume$)(VolumeControl*, SEL, int, float); static void _logos_method$_ungrouped$VolumeControl$_presentVolumeHUDWithMode$volume$(VolumeControl*, SEL, int, float); static void (*_logos_orig$_ungrouped$MPUMediaControlsVolumeView$_volumeSliderStoppedChanging$)(MPUMediaControlsVolumeView*, SEL, id); static void _logos_method$_ungrouped$MPUMediaControlsVolumeView$_volumeSliderStoppedChanging$(MPUMediaControlsVolumeView*, SEL, id); static bool (*_logos_orig$_ungrouped$SBCCFlashlightSetting$isFlashlightOn)(SBCCFlashlightSetting*, SEL); static bool _logos_method$_ungrouped$SBCCFlashlightSetting$isFlashlightOn(SBCCFlashlightSetting*, SEL); static bool (*_logos_orig$_ungrouped$SBCCFlashlightSetting$_enableTorch$)(SBCCFlashlightSetting*, SEL, bool); static bool _logos_method$_ungrouped$SBCCFlashlightSetting$_enableTorch$(SBCCFlashlightSetting*, SEL, bool); static void (*_logos_orig$_ungrouped$SBCCFlashlightSetting$_updateState)(SBCCFlashlightSetting*, SEL); static void _logos_method$_ungrouped$SBCCFlashlightSetting$_updateState(SBCCFlashlightSetting*, SEL); 
static __inline__ __attribute__((always_inline)) Class _logos_static_class_lookup$SBMediaController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBMediaController"); } return _klass; }static __inline__ __attribute__((always_inline)) Class _logos_static_class_lookup$SBBannerController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBBannerController"); } return _klass; }
#line 61 "/Users/Zheng/Projects/VolumeNotifier/VolumeNotifier/VolumeNotifier.xm"
#define IS_PLAYING ([[_logos_static_class_lookup$SBMediaController() sharedInstance] isPlaying])

#define SOUND_PREFS_PATH [NSString stringWithFormat:@"%@/Library/Preferences/%@.plist", NSHomeDirectory(), @"com.apple.preferences.sounds"]

#define APPID @"com.darwindev.VolumeNotifier"
#define PREFS_PATH [NSString stringWithFormat:@"%@/Library/Preferences/%@.plist", NSHomeDirectory(), APPID]

#define DEFAULT_PREFS [NSDictionary dictionaryWithObjectsAndKeys: @DEFAULT_ENABLED, PREFS_ENABLED_KEY, @DEFAULT_ENABLED_WHEN_PLAYING, PREFS_ENABLED_WHEN_PLAYING_KEY, @DEFAULT_VIB_ENABLED, PREFS_VIB_ENABLED_KEY, DEFAULT_SOUND_NAME, PREFS_SOUND_NAME_KEY, @DEFAULT_SOUND_CHOICE, PREFS_SOUND_CHOICE_KEY, @DEFAULT_ENABLED_IN_CC, PREFS_ENABLED_IN_CC_KEY, @DEFAULT_BLOCK_HUD, PREFS_BLOCK_HUD_KEY, @DEFAULT_FLASH_ENABLED, PREFS_FLASH_ENABLED_KEY, nil]

#define IS_IOS_8_PLUS [_logos_static_class_lookup$SBBannerController() instancesRespondToSelector: @selector(_cancelBannerDismissTimers)]

static NSDictionary *preferences = nil;
static NSOperationQueue *queue = [[NSOperationQueue alloc] init];
static NSError *error = nil;
static BOOL torchOpen = NO;
static float systemVolume = 0;

@implementation SNDPlay

- (void) playMedia:(id)data {
    @autoreleasepool {
        SndDelegate *sndMain = [SndDelegate alloc];
        AVAudioPlayer *player = (AVAudioPlayer*)data;
        [player prepareToPlay];
        [player setDelegate:sndMain];
        [player play];
    }
}

- (void) playSound:(int)method {
    @autoreleasepool {
        NSURL* sample;
        NSFileManager *fileM = [NSFileManager defaultManager];
        NSString *soundPath = MAIN_PATH;
        if ((([[soundPath pathExtension] isEqual: @"caf"]) || (([[soundPath pathExtension] isEqual: @"aiff"]))) && ([fileM isReadableFileAtPath:soundPath])) {
            sample = [[NSURL alloc] initWithString:MAIN_PATH];
        } else {
            int choice = MAIN_SOUND_CHOICE;
            switch (choice) {
                case 1:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_A];
                    break;
                case 2:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_B];
                    break;
                case 3:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_C];
                    break;
                case 4:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_D];
                    break;
                case 5:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_E];
                    break;
                case 6:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_F];
                    break;
                case 7:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_G];
                    break;
                default:
                    sample = [[NSURL alloc] initWithString:DEFAULT_SOUND_A];
                    break;
            }
        }
        if (method == 1) {
            SystemSoundID soundID;
            AudioServicesCreateSystemSoundID((CFURLRef)sample, &soundID);
            AudioServicesPlaySystemSound(soundID);
        } else {
            AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:sample error:&error];
            NSInvocationOperation *op = [[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(playMedia:) object:player] autorelease];
            [queue addOperation:op];
        }
        if (MAIN_VIB_ENABLED) {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }
    }
}

@end

static void setTorchLevel(double level) {
    @autoreleasepool {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch]) {
            if (level > 0.1 && level <= 1.0) {
                [device lockForConfiguration:nil];
                [device setTorchModeOnWithLevel:level error:nil];
                [device unlockForConfiguration];
                if (torchOpen == NO) {
                    torchOpen = YES;
                }
            } else if (level <= 0.1){
                [device lockForConfiguration:nil];
                [device setTorchMode:AVCaptureTorchModeOff];
                [device unlockForConfiguration];
                if (torchOpen == YES) {
                    torchOpen = NO;
                }
            }
        }
    }
}



static void _logos_method$_ungrouped$VolumeControl$setVolume$(VolumeControl* self, SEL _cmd, float volume) {
    _logos_orig$_ungrouped$VolumeControl$setVolume$(self, _cmd, volume);
    float maxBound = MIN(volume, 1.f);
    float boundedVolume = MAX(maxBound, 0.f);
    systemVolume = boundedVolume;
}

static void _logos_method$_ungrouped$VolumeControl$increaseVolume(VolumeControl* self, SEL _cmd) {
    _logos_orig$_ungrouped$VolumeControl$increaseVolume(self, _cmd);
    if (MAIN_ENABLED) {
        if ((IS_PLAYING == NO) || (MAIN_ENABLED_WHEN_PLAYING == YES)) {
            SNDPlay *sndObj = [SNDPlay alloc];
            [sndObj playSound:1];
            [sndObj release];
        }
    }
}

static void _logos_method$_ungrouped$VolumeControl$decreaseVolume(VolumeControl* self, SEL _cmd) {
    _logos_orig$_ungrouped$VolumeControl$decreaseVolume(self, _cmd);
    if (MAIN_ENABLED) {
        if ((IS_PLAYING == NO) || (MAIN_ENABLED_WHEN_PLAYING == YES)) {
            SNDPlay *sndObj = [SNDPlay alloc];
            [sndObj playSound:1];
            [sndObj release];
        }
    }
}

static void _logos_method$_ungrouped$VolumeControl$_presentVolumeHUDWithMode$volume$(VolumeControl* self, SEL _cmd, int mode, float vol) {
    if (MAIN_ENABLED) {
        if (MAIN_FLASH_ENABLED == YES) {
            setTorchLevel(vol);
        } else if (torchOpen == YES) {
            setTorchLevel(0);
        }
        if ((MAIN_BLOCK_HUD) == NO) {
            _logos_orig$_ungrouped$VolumeControl$_presentVolumeHUDWithMode$volume$(self, _cmd, mode, vol);
        }
    } else {
        _logos_orig$_ungrouped$VolumeControl$_presentVolumeHUDWithMode$volume$(self, _cmd, mode, vol);
    }
}





static void _logos_method$_ungrouped$MPUMediaControlsVolumeView$_volumeSliderStoppedChanging$(MPUMediaControlsVolumeView* self, SEL _cmd, id pid) {
    _logos_orig$_ungrouped$MPUMediaControlsVolumeView$_volumeSliderStoppedChanging$(self, _cmd, pid);
    if ((MAIN_ENABLED) && (MAIN_CC_ENABLED)) {
        if (IS_PLAYING == NO) {
            SNDPlay *sndObj = [SNDPlay alloc];
            [sndObj playSound:2];
            [sndObj release];
        } else {
            if (MAIN_ENABLED_WHEN_PLAYING == YES) {
                SNDPlay *sndObj = [SNDPlay alloc];
                [sndObj playSound:1];
                [sndObj release];
            }
        }
    }
}





static bool _logos_method$_ungrouped$SBCCFlashlightSetting$isFlashlightOn(SBCCFlashlightSetting* self, SEL _cmd) {
    if (MAIN_ENABLED && MAIN_FLASH_ENABLED) {
        if (_logos_orig$_ungrouped$SBCCFlashlightSetting$isFlashlightOn(self, _cmd) || (torchOpen == YES)) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return _logos_orig$_ungrouped$SBCCFlashlightSetting$isFlashlightOn(self, _cmd);
    }
}

static bool _logos_method$_ungrouped$SBCCFlashlightSetting$_enableTorch$(SBCCFlashlightSetting* self, SEL _cmd, bool arg1) {
    if (MAIN_ENABLED && MAIN_FLASH_ENABLED) {
        if (torchOpen == YES) {
            setTorchLevel(0);
            return NO;
        }
    }
    return _logos_orig$_ungrouped$SBCCFlashlightSetting$_enableTorch$(self, _cmd, arg1);
}

static void _logos_method$_ungrouped$SBCCFlashlightSetting$_updateState(SBCCFlashlightSetting* self, SEL _cmd) {
    if (MAIN_ENABLED && MAIN_FLASH_ENABLED) {
        if (torchOpen == YES) {
            return;
        }
    }
    _logos_orig$_ungrouped$SBCCFlashlightSetting$_updateState(self, _cmd);
}



static void loadSettings () {
    if (preferences) {
        [preferences release];
        preferences = nil;
    }
    if (IS_IOS_8_PLUS) {
        NSArray *keyList = [(NSArray *)CFPreferencesCopyKeyList((CFStringRef)APPID, kCFPreferencesCurrentUser, kCFPreferencesAnyHost) autorelease];
        preferences = (NSDictionary *)CFPreferencesCopyMultiple((CFArrayRef)keyList, (CFStringRef)APPID, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    } else {
        preferences = [[NSDictionary dictionaryWithContentsOfFile: PREFS_PATH] retain];
    }
    if (!preferences || preferences.count == 0) {
        preferences = [DEFAULT_PREFS retain];
    }
    if (torchOpen == YES) {
        setTorchLevel(0);
    }
}

static void didChangeSettings (CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    loadSettings();
}

static __attribute__((constructor)) void _logosLocalCtor_a6d5bc98() {
    CFNotificationCenterRef center = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(center, NULL, &didChangeSettings, (CFStringRef)@"com.darwindev.VolumeNotifier-preferencesChanged", NULL, 0);
    loadSettings();
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$VolumeControl = objc_getClass("VolumeControl"); MSHookMessageEx(_logos_class$_ungrouped$VolumeControl, @selector(setVolume:), (IMP)&_logos_method$_ungrouped$VolumeControl$setVolume$, (IMP*)&_logos_orig$_ungrouped$VolumeControl$setVolume$);MSHookMessageEx(_logos_class$_ungrouped$VolumeControl, @selector(increaseVolume), (IMP)&_logos_method$_ungrouped$VolumeControl$increaseVolume, (IMP*)&_logos_orig$_ungrouped$VolumeControl$increaseVolume);MSHookMessageEx(_logos_class$_ungrouped$VolumeControl, @selector(decreaseVolume), (IMP)&_logos_method$_ungrouped$VolumeControl$decreaseVolume, (IMP*)&_logos_orig$_ungrouped$VolumeControl$decreaseVolume);MSHookMessageEx(_logos_class$_ungrouped$VolumeControl, @selector(_presentVolumeHUDWithMode:volume:), (IMP)&_logos_method$_ungrouped$VolumeControl$_presentVolumeHUDWithMode$volume$, (IMP*)&_logos_orig$_ungrouped$VolumeControl$_presentVolumeHUDWithMode$volume$);Class _logos_class$_ungrouped$MPUMediaControlsVolumeView = objc_getClass("MPUMediaControlsVolumeView"); MSHookMessageEx(_logos_class$_ungrouped$MPUMediaControlsVolumeView, @selector(_volumeSliderStoppedChanging:), (IMP)&_logos_method$_ungrouped$MPUMediaControlsVolumeView$_volumeSliderStoppedChanging$, (IMP*)&_logos_orig$_ungrouped$MPUMediaControlsVolumeView$_volumeSliderStoppedChanging$);Class _logos_class$_ungrouped$SBCCFlashlightSetting = objc_getClass("SBCCFlashlightSetting"); MSHookMessageEx(_logos_class$_ungrouped$SBCCFlashlightSetting, @selector(isFlashlightOn), (IMP)&_logos_method$_ungrouped$SBCCFlashlightSetting$isFlashlightOn, (IMP*)&_logos_orig$_ungrouped$SBCCFlashlightSetting$isFlashlightOn);MSHookMessageEx(_logos_class$_ungrouped$SBCCFlashlightSetting, @selector(_enableTorch:), (IMP)&_logos_method$_ungrouped$SBCCFlashlightSetting$_enableTorch$, (IMP*)&_logos_orig$_ungrouped$SBCCFlashlightSetting$_enableTorch$);MSHookMessageEx(_logos_class$_ungrouped$SBCCFlashlightSetting, @selector(_updateState), (IMP)&_logos_method$_ungrouped$SBCCFlashlightSetting$_updateState, (IMP*)&_logos_orig$_ungrouped$SBCCFlashlightSetting$_updateState);} }
#line 298 "/Users/Zheng/Projects/VolumeNotifier/VolumeNotifier/VolumeNotifier.xm"
