module TD.Data.SessionDeviceType
  (SessionDeviceType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents the type of device from which session was created
data SessionDeviceType
  = SessionDeviceTypeAndroid -- ^ The session is running on an Android device
  | SessionDeviceTypeApple -- ^ The session is running on a generic Apple device
  | SessionDeviceTypeBrave -- ^ The session is running on the Brave browser
  | SessionDeviceTypeChrome -- ^ The session is running on the Chrome browser
  | SessionDeviceTypeEdge -- ^ The session is running on the Edge browser
  | SessionDeviceTypeFirefox -- ^ The session is running on the Firefox browser
  | SessionDeviceTypeIpad -- ^ The session is running on an iPad device
  | SessionDeviceTypeIphone -- ^ The session is running on an iPhone device
  | SessionDeviceTypeLinux -- ^ The session is running on a Linux device
  | SessionDeviceTypeMac -- ^ The session is running on a Mac device
  | SessionDeviceTypeOpera -- ^ The session is running on the Opera browser
  | SessionDeviceTypeSafari -- ^ The session is running on the Safari browser
  | SessionDeviceTypeUbuntu -- ^ The session is running on an Ubuntu device
  | SessionDeviceTypeUnknown -- ^ The session is running on an unknown type of device
  | SessionDeviceTypeVivaldi -- ^ The session is running on the Vivaldi browser
  | SessionDeviceTypeWindows -- ^ The session is running on a Windows device
  | SessionDeviceTypeXbox -- ^ The session is running on an Xbox console
  deriving (Eq, Show)

instance I.ShortShow SessionDeviceType where
  shortShow SessionDeviceTypeAndroid
      = "SessionDeviceTypeAndroid"
  shortShow SessionDeviceTypeApple
      = "SessionDeviceTypeApple"
  shortShow SessionDeviceTypeBrave
      = "SessionDeviceTypeBrave"
  shortShow SessionDeviceTypeChrome
      = "SessionDeviceTypeChrome"
  shortShow SessionDeviceTypeEdge
      = "SessionDeviceTypeEdge"
  shortShow SessionDeviceTypeFirefox
      = "SessionDeviceTypeFirefox"
  shortShow SessionDeviceTypeIpad
      = "SessionDeviceTypeIpad"
  shortShow SessionDeviceTypeIphone
      = "SessionDeviceTypeIphone"
  shortShow SessionDeviceTypeLinux
      = "SessionDeviceTypeLinux"
  shortShow SessionDeviceTypeMac
      = "SessionDeviceTypeMac"
  shortShow SessionDeviceTypeOpera
      = "SessionDeviceTypeOpera"
  shortShow SessionDeviceTypeSafari
      = "SessionDeviceTypeSafari"
  shortShow SessionDeviceTypeUbuntu
      = "SessionDeviceTypeUbuntu"
  shortShow SessionDeviceTypeUnknown
      = "SessionDeviceTypeUnknown"
  shortShow SessionDeviceTypeVivaldi
      = "SessionDeviceTypeVivaldi"
  shortShow SessionDeviceTypeWindows
      = "SessionDeviceTypeWindows"
  shortShow SessionDeviceTypeXbox
      = "SessionDeviceTypeXbox"

instance AT.FromJSON SessionDeviceType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "sessionDeviceTypeAndroid" -> pure SessionDeviceTypeAndroid
      "sessionDeviceTypeApple"   -> pure SessionDeviceTypeApple
      "sessionDeviceTypeBrave"   -> pure SessionDeviceTypeBrave
      "sessionDeviceTypeChrome"  -> pure SessionDeviceTypeChrome
      "sessionDeviceTypeEdge"    -> pure SessionDeviceTypeEdge
      "sessionDeviceTypeFirefox" -> pure SessionDeviceTypeFirefox
      "sessionDeviceTypeIpad"    -> pure SessionDeviceTypeIpad
      "sessionDeviceTypeIphone"  -> pure SessionDeviceTypeIphone
      "sessionDeviceTypeLinux"   -> pure SessionDeviceTypeLinux
      "sessionDeviceTypeMac"     -> pure SessionDeviceTypeMac
      "sessionDeviceTypeOpera"   -> pure SessionDeviceTypeOpera
      "sessionDeviceTypeSafari"  -> pure SessionDeviceTypeSafari
      "sessionDeviceTypeUbuntu"  -> pure SessionDeviceTypeUbuntu
      "sessionDeviceTypeUnknown" -> pure SessionDeviceTypeUnknown
      "sessionDeviceTypeVivaldi" -> pure SessionDeviceTypeVivaldi
      "sessionDeviceTypeWindows" -> pure SessionDeviceTypeWindows
      "sessionDeviceTypeXbox"    -> pure SessionDeviceTypeXbox
      _                          -> mempty
    
  parseJSON _ = mempty

