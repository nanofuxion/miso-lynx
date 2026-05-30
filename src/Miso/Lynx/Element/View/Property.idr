module Miso.Lynx.Element.View.Property

import Miso.Attr
import Miso.Types
import Miso.Lynx.JSON

export
id_ : String -> Attr action
id_ = textProp "id"

export
name_ : String -> Attr action
name_ = textProp "name"

export
className_ : String -> Attr action
className_ = textProp "className"

export
flatten_ : Bool -> Attr action
flatten_ = boolProp "flatten"

export
exposureId_ : String -> Attr action
exposureId_ = textProp "exposure-id"

export
exposureScene_ : String -> Attr action
exposureScene_ = textProp "exposure-scene"

export
exposeUIMarginTop_ : String -> Attr action
exposeUIMarginTop_ = textProp "exposure-ui-margin-top"

export
exposeUIMarginBottom_ : String -> Attr action
exposeUIMarginBottom_ = textProp "exposure-ui-margin-bottom"

export
exposeUIMarginLeft_ : String -> Attr action
exposeUIMarginLeft_ = textProp "exposure-ui-margin-left"

export
exposeUIMarginRight_ : String -> Attr action
exposeUIMarginRight_ = textProp "exposure-screen-margin-right"

export
exposeScreenMarginTop_ : String -> Attr action
exposeScreenMarginTop_ = textProp "exposure-screen-margin-top"

export
exposeScreenMarginBottom_ : String -> Attr action
exposeScreenMarginBottom_ = textProp "exposure-screen-margin-bottom"

export
exposeScreenMarginLeft_ : String -> Attr action
exposeScreenMarginLeft_ = textProp "exposure-screen-margin-left"

export
exposeScreenMarginRight_ : String -> Attr action
exposeScreenMarginRight_ = textProp "exposure-screen-margin-right"

export
exposureArea_ : String -> Attr action
exposureArea_ = textProp "exposure-area"

export
enableExposureUIMargin_ : Bool -> Attr action
enableExposureUIMargin_ = boolProp "enable-exposure-ui-margin"

export
accessibilityElement_ : Bool -> Attr action
accessibilityElement_ = boolProp "accessibility-element"

export
accessibilityLabel_ : String -> Attr action
accessibilityLabel_ = textProp "accessibility-label"

export
accessibilityTrait_ : String -> Attr action
accessibilityTrait_ = textProp "accessibility-trait"

export
accessibilityElements_ : String -> Attr action
accessibilityElements_ = textProp "accessibility-elements"

export
accessibilityElementsA11y_ : String -> Attr action
accessibilityElementsA11y_ = textProp "accessibility-elements-a11y"

export
accessibilityElementsHidden_ : Bool -> Attr action
accessibilityElementsHidden_ = boolProp "accessibilityElementsHidden_"

export
accessibilityExclusiveFocus_ : Bool -> Attr action
accessibilityExclusiveFocus_ = boolProp "accessibility-exclusive-focus"

export
a11yId_ : String -> Attr action
a11yId_ = textProp "a11y-id"

export
iosPlatformAccessibilityId_ : String -> Attr action
iosPlatformAccessibilityId_ = textProp "ios-platform-accessibility-id"

export
userInteractionEnabled_ : Bool -> Attr action
userInteractionEnabled_ = boolProp "user-interaction-enabled"

export
nativeInteractionEnabled_ : Bool -> Attr action
nativeInteractionEnabled_ = boolProp "native-interaction-enabled"

export
blockNativeEvent_ : Bool -> Attr action
blockNativeEvent_ = boolProp "block-native-event"

export
blockNativeEventAreas_ : Int -> Attr action
blockNativeEventAreas_ v = Prop "block-native-event-areas" (show v)

export
consumeSlideEvent_ : Double -> Attr action
consumeSlideEvent_ v = Prop "consume-slide-event" (show v)

export
eventThrough_ : Bool -> Attr action
eventThrough_ = boolProp "event-through"

export
enableTouchPseudoPropagation_ : Bool -> Attr action
enableTouchPseudoPropagation_ = boolProp "enable-touch-pseudo-propagation"

export
hitSlop_ : String -> Attr action
hitSlop_ = textProp "hit-slop"

export
ignoreFocus_ : String -> Attr action
ignoreFocus_ = textProp "ignore-focus"

export
iosEnableSimultaneousTouch_ : Bool -> Attr action
iosEnableSimultaneousTouch_ = boolProp "ios-enable-simultaneous-touch"

export
lynxTimingFlag_ : String -> Attr action
lynxTimingFlag_ = textProp "__lynx_timing_flag"

