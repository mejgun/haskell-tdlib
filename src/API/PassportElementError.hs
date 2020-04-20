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



instance T.FromJSON PassportElementError where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "passportElementError" -> parsePassportElementError v
  where
   parsePassportElementError :: A.Value -> T.Parser PassportElementError
   parsePassportElementError = A.withObject "PassportElementError" $ \o -> do
    source <- o A..: "source"
    message <- o A..: "message"
    _type <- o A..: "type"
    return $ PassportElementError { source = source, message = message, _type = _type }