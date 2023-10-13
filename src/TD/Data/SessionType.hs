module TD.Data.SessionType
  ( SessionType(..) 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data SessionType -- ^ Represents the type of a session
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
  deriving (Eq)

instance Show SessionType where
  show SessionTypeAndroid
      = "SessionTypeAndroid"
  show SessionTypeApple
      = "SessionTypeApple"
  show SessionTypeBrave
      = "SessionTypeBrave"
  show SessionTypeChrome
      = "SessionTypeChrome"
  show SessionTypeEdge
      = "SessionTypeEdge"
  show SessionTypeFirefox
      = "SessionTypeFirefox"
  show SessionTypeIpad
      = "SessionTypeIpad"
  show SessionTypeIphone
      = "SessionTypeIphone"
  show SessionTypeLinux
      = "SessionTypeLinux"
  show SessionTypeMac
      = "SessionTypeMac"
  show SessionTypeOpera
      = "SessionTypeOpera"
  show SessionTypeSafari
      = "SessionTypeSafari"
  show SessionTypeUbuntu
      = "SessionTypeUbuntu"
  show SessionTypeUnknown
      = "SessionTypeUnknown"
  show SessionTypeVivaldi
      = "SessionTypeVivaldi"
  show SessionTypeWindows
      = "SessionTypeWindows"
  show SessionTypeXbox
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

instance AT.ToJSON SessionType where
  toJSON SessionTypeAndroid
      = A.object
        [ "@type" A..= AT.String "sessionTypeAndroid"
        ]
  toJSON SessionTypeApple
      = A.object
        [ "@type" A..= AT.String "sessionTypeApple"
        ]
  toJSON SessionTypeBrave
      = A.object
        [ "@type" A..= AT.String "sessionTypeBrave"
        ]
  toJSON SessionTypeChrome
      = A.object
        [ "@type" A..= AT.String "sessionTypeChrome"
        ]
  toJSON SessionTypeEdge
      = A.object
        [ "@type" A..= AT.String "sessionTypeEdge"
        ]
  toJSON SessionTypeFirefox
      = A.object
        [ "@type" A..= AT.String "sessionTypeFirefox"
        ]
  toJSON SessionTypeIpad
      = A.object
        [ "@type" A..= AT.String "sessionTypeIpad"
        ]
  toJSON SessionTypeIphone
      = A.object
        [ "@type" A..= AT.String "sessionTypeIphone"
        ]
  toJSON SessionTypeLinux
      = A.object
        [ "@type" A..= AT.String "sessionTypeLinux"
        ]
  toJSON SessionTypeMac
      = A.object
        [ "@type" A..= AT.String "sessionTypeMac"
        ]
  toJSON SessionTypeOpera
      = A.object
        [ "@type" A..= AT.String "sessionTypeOpera"
        ]
  toJSON SessionTypeSafari
      = A.object
        [ "@type" A..= AT.String "sessionTypeSafari"
        ]
  toJSON SessionTypeUbuntu
      = A.object
        [ "@type" A..= AT.String "sessionTypeUbuntu"
        ]
  toJSON SessionTypeUnknown
      = A.object
        [ "@type" A..= AT.String "sessionTypeUnknown"
        ]
  toJSON SessionTypeVivaldi
      = A.object
        [ "@type" A..= AT.String "sessionTypeVivaldi"
        ]
  toJSON SessionTypeWindows
      = A.object
        [ "@type" A..= AT.String "sessionTypeWindows"
        ]
  toJSON SessionTypeXbox
      = A.object
        [ "@type" A..= AT.String "sessionTypeXbox"
        ]

