-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportElementError where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportElementErrorSource as PassportElementErrorSource
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

-- |
-- 
-- Contains the description of an error in a Telegram Passport element 
-- 
-- __type__ Type of the Telegram Passport element which has the error
-- 
-- __message__ Error message
-- 
-- __source__ Error source
data PassportElementError = 

 PassportElementError { source :: Maybe PassportElementErrorSource.PassportElementErrorSource, message :: Maybe String, _type :: Maybe PassportElementType.PassportElementType }  deriving (Show, Eq)

instance T.ToJSON PassportElementError where
 toJSON (PassportElementError { source = source, message = message, _type = _type }) =
  A.object [ "@type" A..= T.String "passportElementError", "source" A..= source, "message" A..= message, "type" A..= _type ]

instance T.FromJSON PassportElementError where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "passportElementError" -> parsePassportElementError v
   _ -> mempty
  where
   parsePassportElementError :: A.Value -> T.Parser PassportElementError
   parsePassportElementError = A.withObject "PassportElementError" $ \o -> do
    source <- o A..:? "source"
    message <- o A..:? "message"
    _type <- o A..:? "type"
    return $ PassportElementError { source = source, message = message, _type = _type }