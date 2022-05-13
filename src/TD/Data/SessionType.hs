{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.SessionType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents the type of a session
data SessionType
  = -- | The session is running on an Android device
    SessionTypeAndroid
  | -- | The session is running on a generic Apple device
    SessionTypeApple
  | -- | The session is running on the Brave browser
    SessionTypeBrave
  | -- | The session is running on the Chrome browser
    SessionTypeChrome
  | -- | The session is running on the Edge browser
    SessionTypeEdge
  | -- | The session is running on the Firefox browser
    SessionTypeFirefox
  | -- | The session is running on an iPad device
    SessionTypeIpad
  | -- | The session is running on an iPhone device
    SessionTypeIphone
  | -- | The session is running on a Linux device
    SessionTypeLinux
  | -- | The session is running on a Mac device
    SessionTypeMac
  | -- | The session is running on the Opera browser
    SessionTypeOpera
  | -- | The session is running on the Safari browser
    SessionTypeSafari
  | -- | The session is running on an Ubuntu device
    SessionTypeUbuntu
  | -- | The session is running on an unknown type of device
    SessionTypeUnknown
  | -- | The session is running on the Vivaldi browser
    SessionTypeVivaldi
  | -- | The session is running on a Windows device
    SessionTypeWindows
  | -- | The session is running on an Xbox console
    SessionTypeXbox
  deriving (Eq)

instance Show SessionType where
  show SessionTypeAndroid =
    "SessionTypeAndroid"
      ++ U.cc
        []
  show SessionTypeApple =
    "SessionTypeApple"
      ++ U.cc
        []
  show SessionTypeBrave =
    "SessionTypeBrave"
      ++ U.cc
        []
  show SessionTypeChrome =
    "SessionTypeChrome"
      ++ U.cc
        []
  show SessionTypeEdge =
    "SessionTypeEdge"
      ++ U.cc
        []
  show SessionTypeFirefox =
    "SessionTypeFirefox"
      ++ U.cc
        []
  show SessionTypeIpad =
    "SessionTypeIpad"
      ++ U.cc
        []
  show SessionTypeIphone =
    "SessionTypeIphone"
      ++ U.cc
        []
  show SessionTypeLinux =
    "SessionTypeLinux"
      ++ U.cc
        []
  show SessionTypeMac =
    "SessionTypeMac"
      ++ U.cc
        []
  show SessionTypeOpera =
    "SessionTypeOpera"
      ++ U.cc
        []
  show SessionTypeSafari =
    "SessionTypeSafari"
      ++ U.cc
        []
  show SessionTypeUbuntu =
    "SessionTypeUbuntu"
      ++ U.cc
        []
  show SessionTypeUnknown =
    "SessionTypeUnknown"
      ++ U.cc
        []
  show SessionTypeVivaldi =
    "SessionTypeVivaldi"
      ++ U.cc
        []
  show SessionTypeWindows =
    "SessionTypeWindows"
      ++ U.cc
        []
  show SessionTypeXbox =
    "SessionTypeXbox"
      ++ U.cc
        []

instance T.FromJSON SessionType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "sessionTypeAndroid" -> parseSessionTypeAndroid v
      "sessionTypeApple" -> parseSessionTypeApple v
      "sessionTypeBrave" -> parseSessionTypeBrave v
      "sessionTypeChrome" -> parseSessionTypeChrome v
      "sessionTypeEdge" -> parseSessionTypeEdge v
      "sessionTypeFirefox" -> parseSessionTypeFirefox v
      "sessionTypeIpad" -> parseSessionTypeIpad v
      "sessionTypeIphone" -> parseSessionTypeIphone v
      "sessionTypeLinux" -> parseSessionTypeLinux v
      "sessionTypeMac" -> parseSessionTypeMac v
      "sessionTypeOpera" -> parseSessionTypeOpera v
      "sessionTypeSafari" -> parseSessionTypeSafari v
      "sessionTypeUbuntu" -> parseSessionTypeUbuntu v
      "sessionTypeUnknown" -> parseSessionTypeUnknown v
      "sessionTypeVivaldi" -> parseSessionTypeVivaldi v
      "sessionTypeWindows" -> parseSessionTypeWindows v
      "sessionTypeXbox" -> parseSessionTypeXbox v
      _ -> mempty
    where
      parseSessionTypeAndroid :: A.Value -> T.Parser SessionType
      parseSessionTypeAndroid = A.withObject "SessionTypeAndroid" $ \_ -> return SessionTypeAndroid

      parseSessionTypeApple :: A.Value -> T.Parser SessionType
      parseSessionTypeApple = A.withObject "SessionTypeApple" $ \_ -> return SessionTypeApple

      parseSessionTypeBrave :: A.Value -> T.Parser SessionType
      parseSessionTypeBrave = A.withObject "SessionTypeBrave" $ \_ -> return SessionTypeBrave

      parseSessionTypeChrome :: A.Value -> T.Parser SessionType
      parseSessionTypeChrome = A.withObject "SessionTypeChrome" $ \_ -> return SessionTypeChrome

      parseSessionTypeEdge :: A.Value -> T.Parser SessionType
      parseSessionTypeEdge = A.withObject "SessionTypeEdge" $ \_ -> return SessionTypeEdge

      parseSessionTypeFirefox :: A.Value -> T.Parser SessionType
      parseSessionTypeFirefox = A.withObject "SessionTypeFirefox" $ \_ -> return SessionTypeFirefox

      parseSessionTypeIpad :: A.Value -> T.Parser SessionType
      parseSessionTypeIpad = A.withObject "SessionTypeIpad" $ \_ -> return SessionTypeIpad

      parseSessionTypeIphone :: A.Value -> T.Parser SessionType
      parseSessionTypeIphone = A.withObject "SessionTypeIphone" $ \_ -> return SessionTypeIphone

      parseSessionTypeLinux :: A.Value -> T.Parser SessionType
      parseSessionTypeLinux = A.withObject "SessionTypeLinux" $ \_ -> return SessionTypeLinux

      parseSessionTypeMac :: A.Value -> T.Parser SessionType
      parseSessionTypeMac = A.withObject "SessionTypeMac" $ \_ -> return SessionTypeMac

      parseSessionTypeOpera :: A.Value -> T.Parser SessionType
      parseSessionTypeOpera = A.withObject "SessionTypeOpera" $ \_ -> return SessionTypeOpera

      parseSessionTypeSafari :: A.Value -> T.Parser SessionType
      parseSessionTypeSafari = A.withObject "SessionTypeSafari" $ \_ -> return SessionTypeSafari

      parseSessionTypeUbuntu :: A.Value -> T.Parser SessionType
      parseSessionTypeUbuntu = A.withObject "SessionTypeUbuntu" $ \_ -> return SessionTypeUbuntu

      parseSessionTypeUnknown :: A.Value -> T.Parser SessionType
      parseSessionTypeUnknown = A.withObject "SessionTypeUnknown" $ \_ -> return SessionTypeUnknown

      parseSessionTypeVivaldi :: A.Value -> T.Parser SessionType
      parseSessionTypeVivaldi = A.withObject "SessionTypeVivaldi" $ \_ -> return SessionTypeVivaldi

      parseSessionTypeWindows :: A.Value -> T.Parser SessionType
      parseSessionTypeWindows = A.withObject "SessionTypeWindows" $ \_ -> return SessionTypeWindows

      parseSessionTypeXbox :: A.Value -> T.Parser SessionType
      parseSessionTypeXbox = A.withObject "SessionTypeXbox" $ \_ -> return SessionTypeXbox
  parseJSON _ = mempty

instance T.ToJSON SessionType where
  toJSON SessionTypeAndroid =
    A.object
      [ "@type" A..= T.String "sessionTypeAndroid"
      ]
  toJSON SessionTypeApple =
    A.object
      [ "@type" A..= T.String "sessionTypeApple"
      ]
  toJSON SessionTypeBrave =
    A.object
      [ "@type" A..= T.String "sessionTypeBrave"
      ]
  toJSON SessionTypeChrome =
    A.object
      [ "@type" A..= T.String "sessionTypeChrome"
      ]
  toJSON SessionTypeEdge =
    A.object
      [ "@type" A..= T.String "sessionTypeEdge"
      ]
  toJSON SessionTypeFirefox =
    A.object
      [ "@type" A..= T.String "sessionTypeFirefox"
      ]
  toJSON SessionTypeIpad =
    A.object
      [ "@type" A..= T.String "sessionTypeIpad"
      ]
  toJSON SessionTypeIphone =
    A.object
      [ "@type" A..= T.String "sessionTypeIphone"
      ]
  toJSON SessionTypeLinux =
    A.object
      [ "@type" A..= T.String "sessionTypeLinux"
      ]
  toJSON SessionTypeMac =
    A.object
      [ "@type" A..= T.String "sessionTypeMac"
      ]
  toJSON SessionTypeOpera =
    A.object
      [ "@type" A..= T.String "sessionTypeOpera"
      ]
  toJSON SessionTypeSafari =
    A.object
      [ "@type" A..= T.String "sessionTypeSafari"
      ]
  toJSON SessionTypeUbuntu =
    A.object
      [ "@type" A..= T.String "sessionTypeUbuntu"
      ]
  toJSON SessionTypeUnknown =
    A.object
      [ "@type" A..= T.String "sessionTypeUnknown"
      ]
  toJSON SessionTypeVivaldi =
    A.object
      [ "@type" A..= T.String "sessionTypeVivaldi"
      ]
  toJSON SessionTypeWindows =
    A.object
      [ "@type" A..= T.String "sessionTypeWindows"
      ]
  toJSON SessionTypeXbox =
    A.object
      [ "@type" A..= T.String "sessionTypeXbox"
      ]
