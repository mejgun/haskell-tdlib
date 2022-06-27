{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.KeyboardButtonType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes a keyboard button type
data KeyboardButtonType
  = -- | A simple button, with text that must be sent when the button is pressed
    KeyboardButtonTypeText
  | -- | A button that sends the user's phone number when pressed; available only in private chats
    KeyboardButtonTypeRequestPhoneNumber
  | -- | A button that sends the user's location when pressed; available only in private chats
    KeyboardButtonTypeRequestLocation
  | -- | A button that allows the user to create and send a poll when pressed; available only in private chats @force_regular If true, only regular polls must be allowed to create @force_quiz If true, only polls in quiz mode must be allowed to create
    KeyboardButtonTypeRequestPoll
      { -- |
        force_quiz :: Maybe Bool,
        -- |
        force_regular :: Maybe Bool
      }
  | -- | A button that opens a Web App by calling getWebAppUrl @url An HTTP URL to pass to getWebAppUrl
    KeyboardButtonTypeWebApp
      { -- |
        url :: Maybe String
      }
  deriving (Eq)

instance Show KeyboardButtonType where
  show KeyboardButtonTypeText =
    "KeyboardButtonTypeText"
      ++ U.cc
        []
  show KeyboardButtonTypeRequestPhoneNumber =
    "KeyboardButtonTypeRequestPhoneNumber"
      ++ U.cc
        []
  show KeyboardButtonTypeRequestLocation =
    "KeyboardButtonTypeRequestLocation"
      ++ U.cc
        []
  show
    KeyboardButtonTypeRequestPoll
      { force_quiz = force_quiz_,
        force_regular = force_regular_
      } =
      "KeyboardButtonTypeRequestPoll"
        ++ U.cc
          [ U.p "force_quiz" force_quiz_,
            U.p "force_regular" force_regular_
          ]
  show
    KeyboardButtonTypeWebApp
      { url = url_
      } =
      "KeyboardButtonTypeWebApp"
        ++ U.cc
          [ U.p "url" url_
          ]

instance T.FromJSON KeyboardButtonType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "keyboardButtonTypeText" -> parseKeyboardButtonTypeText v
      "keyboardButtonTypeRequestPhoneNumber" -> parseKeyboardButtonTypeRequestPhoneNumber v
      "keyboardButtonTypeRequestLocation" -> parseKeyboardButtonTypeRequestLocation v
      "keyboardButtonTypeRequestPoll" -> parseKeyboardButtonTypeRequestPoll v
      "keyboardButtonTypeWebApp" -> parseKeyboardButtonTypeWebApp v
      _ -> mempty
    where
      parseKeyboardButtonTypeText :: A.Value -> T.Parser KeyboardButtonType
      parseKeyboardButtonTypeText = A.withObject "KeyboardButtonTypeText" $ \_ -> return KeyboardButtonTypeText

      parseKeyboardButtonTypeRequestPhoneNumber :: A.Value -> T.Parser KeyboardButtonType
      parseKeyboardButtonTypeRequestPhoneNumber = A.withObject "KeyboardButtonTypeRequestPhoneNumber" $ \_ -> return KeyboardButtonTypeRequestPhoneNumber

      parseKeyboardButtonTypeRequestLocation :: A.Value -> T.Parser KeyboardButtonType
      parseKeyboardButtonTypeRequestLocation = A.withObject "KeyboardButtonTypeRequestLocation" $ \_ -> return KeyboardButtonTypeRequestLocation

      parseKeyboardButtonTypeRequestPoll :: A.Value -> T.Parser KeyboardButtonType
      parseKeyboardButtonTypeRequestPoll = A.withObject "KeyboardButtonTypeRequestPoll" $ \o -> do
        force_quiz_ <- o A..:? "force_quiz"
        force_regular_ <- o A..:? "force_regular"
        return $ KeyboardButtonTypeRequestPoll {force_quiz = force_quiz_, force_regular = force_regular_}

      parseKeyboardButtonTypeWebApp :: A.Value -> T.Parser KeyboardButtonType
      parseKeyboardButtonTypeWebApp = A.withObject "KeyboardButtonTypeWebApp" $ \o -> do
        url_ <- o A..:? "url"
        return $ KeyboardButtonTypeWebApp {url = url_}
  parseJSON _ = mempty

instance T.ToJSON KeyboardButtonType where
  toJSON KeyboardButtonTypeText =
    A.object
      [ "@type" A..= T.String "keyboardButtonTypeText"
      ]
  toJSON KeyboardButtonTypeRequestPhoneNumber =
    A.object
      [ "@type" A..= T.String "keyboardButtonTypeRequestPhoneNumber"
      ]
  toJSON KeyboardButtonTypeRequestLocation =
    A.object
      [ "@type" A..= T.String "keyboardButtonTypeRequestLocation"
      ]
  toJSON
    KeyboardButtonTypeRequestPoll
      { force_quiz = force_quiz_,
        force_regular = force_regular_
      } =
      A.object
        [ "@type" A..= T.String "keyboardButtonTypeRequestPoll",
          "force_quiz" A..= force_quiz_,
          "force_regular" A..= force_regular_
        ]
  toJSON
    KeyboardButtonTypeWebApp
      { url = url_
      } =
      A.object
        [ "@type" A..= T.String "keyboardButtonTypeWebApp",
          "url" A..= url_
        ]
