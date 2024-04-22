module TD.Data.SessionType
  (SessionType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents the type of session
data SessionType
  = SessionTypeAndroid -- ^ The session is running on an Android device
  | SessionTypeApple -- ^ The session is running on a generic Apple device
  | SessionTypeBrave -- ^ The session is running on the Brave browser
  | SessionTypeChrome -- ^ The session is running on the Chrome browser
  | SessionTypeEdge -- ^ The session is running on the Edge browser
  | SessionTypeFirefox -- ^ The session is running on the Firefox browser
  | SessionTypeIpad -- ^ The session is running on an iPad device
  | SessionTypeIphone -- ^ The session is running on an iPhone device
  | SessionTypeLinux -- ^ The session is running on a Linux device
  | SessionTypeMac -- ^ The session is running on a Mac device
  | SessionTypeOpera -- ^ The session is running on the Opera browser
  | SessionTypeSafari -- ^ The session is running on the Safari browser
  | SessionTypeUbuntu -- ^ The session is running on an Ubuntu device
  | SessionTypeUnknown -- ^ The session is running on an unknown type of device
  | SessionTypeVivaldi -- ^ The session is running on the Vivaldi browser
  | SessionTypeWindows -- ^ The session is running on a Windows device
  | SessionTypeXbox -- ^ The session is running on an Xbox console
  deriving (Eq, Show)

instance I.ShortShow SessionType where
  shortShow SessionTypeAndroid
      = "SessionTypeAndroid"
  shortShow SessionTypeApple
      = "SessionTypeApple"
  shortShow SessionTypeBrave
      = "SessionTypeBrave"
  shortShow SessionTypeChrome
      = "SessionTypeChrome"
  shortShow SessionTypeEdge
      = "SessionTypeEdge"
  shortShow SessionTypeFirefox
      = "SessionTypeFirefox"
  shortShow SessionTypeIpad
      = "SessionTypeIpad"
  shortShow SessionTypeIphone
      = "SessionTypeIphone"
  shortShow SessionTypeLinux
      = "SessionTypeLinux"
  shortShow SessionTypeMac
      = "SessionTypeMac"
  shortShow SessionTypeOpera
      = "SessionTypeOpera"
  shortShow SessionTypeSafari
      = "SessionTypeSafari"
  shortShow SessionTypeUbuntu
      = "SessionTypeUbuntu"
  shortShow SessionTypeUnknown
      = "SessionTypeUnknown"
  shortShow SessionTypeVivaldi
      = "SessionTypeVivaldi"
  shortShow SessionTypeWindows
      = "SessionTypeWindows"
  shortShow SessionTypeXbox
      = "SessionTypeXbox"

instance AT.FromJSON SessionType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "sessionTypeAndroid" -> pure SessionTypeAndroid
      "sessionTypeApple"   -> pure SessionTypeApple
      "sessionTypeBrave"   -> pure SessionTypeBrave
      "sessionTypeChrome"  -> pure SessionTypeChrome
      "sessionTypeEdge"    -> pure SessionTypeEdge
      "sessionTypeFirefox" -> pure SessionTypeFirefox
      "sessionTypeIpad"    -> pure SessionTypeIpad
      "sessionTypeIphone"  -> pure SessionTypeIphone
      "sessionTypeLinux"   -> pure SessionTypeLinux
      "sessionTypeMac"     -> pure SessionTypeMac
      "sessionTypeOpera"   -> pure SessionTypeOpera
      "sessionTypeSafari"  -> pure SessionTypeSafari
      "sessionTypeUbuntu"  -> pure SessionTypeUbuntu
      "sessionTypeUnknown" -> pure SessionTypeUnknown
      "sessionTypeVivaldi" -> pure SessionTypeVivaldi
      "sessionTypeWindows" -> pure SessionTypeWindows
      "sessionTypeXbox"    -> pure SessionTypeXbox
      _                    -> mempty
    
  parseJSON _ = mempty

