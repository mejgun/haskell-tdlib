-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportElementError where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportElementErrorSource as PassportElementErrorSource
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

--main = putStrLn "ok"

data PassportElementError = 
 PassportElementError { source :: PassportElementErrorSource.PassportElementErrorSource, message :: String, _type :: PassportElementType.PassportElementType }  -- deriving (Show)

instance T.ToJSON PassportElementError where
 toJSON (PassportElementError { source = source, message = message, _type = _type }) =
  A.object [ "@type" A..= T.String "passportElementError", "source" A..= source, "message" A..= message, "type" A..= _type ]
-- passportElementError PassportElementError  { source :: PassportElementErrorSource.PassportElementErrorSource, message :: String, _type :: PassportElementType.PassportElementType } 

