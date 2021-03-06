-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.KeyboardButtonType where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes a keyboard button type
data KeyboardButtonType = 
 -- |
 -- 
 -- A simple button, with text that should be sent when the button is pressed
 KeyboardButtonTypeText |
 -- |
 -- 
 -- A button that sends the user's phone number when pressed; available only in private chats
 KeyboardButtonTypeRequestPhoneNumber |
 -- |
 -- 
 -- A button that sends the user's location when pressed; available only in private chats
 KeyboardButtonTypeRequestLocation |
 -- |
 -- 
 -- A button that allows the user to create and send a poll when pressed; available only in private chats 
 -- 
 -- __force_regular__ If true, only regular polls must be allowed to create
 -- 
 -- __force_quiz__ If true, only polls in quiz mode must be allowed to create
 KeyboardButtonTypeRequestPoll { force_quiz :: Maybe Bool, force_regular :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON KeyboardButtonType where
 toJSON (KeyboardButtonTypeText {  }) =
  A.object [ "@type" A..= T.String "keyboardButtonTypeText" ]

 toJSON (KeyboardButtonTypeRequestPhoneNumber {  }) =
  A.object [ "@type" A..= T.String "keyboardButtonTypeRequestPhoneNumber" ]

 toJSON (KeyboardButtonTypeRequestLocation {  }) =
  A.object [ "@type" A..= T.String "keyboardButtonTypeRequestLocation" ]

 toJSON (KeyboardButtonTypeRequestPoll { force_quiz = force_quiz, force_regular = force_regular }) =
  A.object [ "@type" A..= T.String "keyboardButtonTypeRequestPoll", "force_quiz" A..= force_quiz, "force_regular" A..= force_regular ]

instance T.FromJSON KeyboardButtonType where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "keyboardButtonTypeText" -> parseKeyboardButtonTypeText v
   "keyboardButtonTypeRequestPhoneNumber" -> parseKeyboardButtonTypeRequestPhoneNumber v
   "keyboardButtonTypeRequestLocation" -> parseKeyboardButtonTypeRequestLocation v
   "keyboardButtonTypeRequestPoll" -> parseKeyboardButtonTypeRequestPoll v
   _ -> mempty
  where
   parseKeyboardButtonTypeText :: A.Value -> T.Parser KeyboardButtonType
   parseKeyboardButtonTypeText = A.withObject "KeyboardButtonTypeText" $ \o -> do
    return $ KeyboardButtonTypeText {  }

   parseKeyboardButtonTypeRequestPhoneNumber :: A.Value -> T.Parser KeyboardButtonType
   parseKeyboardButtonTypeRequestPhoneNumber = A.withObject "KeyboardButtonTypeRequestPhoneNumber" $ \o -> do
    return $ KeyboardButtonTypeRequestPhoneNumber {  }

   parseKeyboardButtonTypeRequestLocation :: A.Value -> T.Parser KeyboardButtonType
   parseKeyboardButtonTypeRequestLocation = A.withObject "KeyboardButtonTypeRequestLocation" $ \o -> do
    return $ KeyboardButtonTypeRequestLocation {  }

   parseKeyboardButtonTypeRequestPoll :: A.Value -> T.Parser KeyboardButtonType
   parseKeyboardButtonTypeRequestPoll = A.withObject "KeyboardButtonTypeRequestPoll" $ \o -> do
    force_quiz <- o A..:? "force_quiz"
    force_regular <- o A..:? "force_regular"
    return $ KeyboardButtonTypeRequestPoll { force_quiz = force_quiz, force_regular = force_regular }