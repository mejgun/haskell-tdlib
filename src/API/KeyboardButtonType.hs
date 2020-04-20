-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.KeyboardButtonType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data KeyboardButtonType = 
 KeyboardButtonTypeText 
 | KeyboardButtonTypeRequestPhoneNumber 
 | KeyboardButtonTypeRequestLocation 
 | KeyboardButtonTypeRequestPoll { force_quiz :: Bool, force_regular :: Bool }  -- deriving (Show)

instance T.ToJSON KeyboardButtonType where
 toJSON (KeyboardButtonTypeText {  }) =
  A.object [ "@type" A..= T.String "keyboardButtonTypeText" ]

 toJSON (KeyboardButtonTypeRequestPhoneNumber {  }) =
  A.object [ "@type" A..= T.String "keyboardButtonTypeRequestPhoneNumber" ]

 toJSON (KeyboardButtonTypeRequestLocation {  }) =
  A.object [ "@type" A..= T.String "keyboardButtonTypeRequestLocation" ]

 toJSON (KeyboardButtonTypeRequestPoll { force_quiz = force_quiz, force_regular = force_regular }) =
  A.object [ "@type" A..= T.String "keyboardButtonTypeRequestPoll", "force_quiz" A..= force_quiz, "force_regular" A..= force_regular ]
-- keyboardButtonTypeText KeyboardButtonType 

-- keyboardButtonTypeRequestPhoneNumber KeyboardButtonType 

-- keyboardButtonTypeRequestLocation KeyboardButtonType 

-- keyboardButtonTypeRequestPoll KeyboardButtonType  { force_quiz :: Bool, force_regular :: Bool } 

