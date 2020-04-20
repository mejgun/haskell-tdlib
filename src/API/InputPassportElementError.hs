-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputPassportElementError where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputPassportElementErrorSource as InputPassportElementErrorSource
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

--main = putStrLn "ok"

data InputPassportElementError = 
 InputPassportElementError { source :: InputPassportElementErrorSource.InputPassportElementErrorSource, message :: String, _type :: PassportElementType.PassportElementType }  -- deriving (Show)

instance T.ToJSON InputPassportElementError where
 toJSON (InputPassportElementError { source = source, message = message, _type = _type }) =
  A.object [ "@type" A..= T.String "inputPassportElementError", "source" A..= source, "message" A..= message, "type" A..= _type ]
-- inputPassportElementError InputPassportElementError  { source :: InputPassportElementErrorSource.InputPassportElementErrorSource, message :: String, _type :: PassportElementType.PassportElementType } 

