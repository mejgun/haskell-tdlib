-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPassportElement where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

-- |
-- 
-- Returns one of the available Telegram Passport elements 
-- 
-- __type__ Telegram Passport element type
-- 
-- __password__ Password of the current user
data GetPassportElement = 

 GetPassportElement { password :: Maybe String, _type :: Maybe PassportElementType.PassportElementType }  deriving (Show, Eq)

instance T.ToJSON GetPassportElement where
 toJSON (GetPassportElement { password = password, _type = _type }) =
  A.object [ "@type" A..= T.String "getPassportElement", "password" A..= password, "type" A..= _type ]

instance T.FromJSON GetPassportElement where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPassportElement" -> parseGetPassportElement v
   _ -> mempty
  where
   parseGetPassportElement :: A.Value -> T.Parser GetPassportElement
   parseGetPassportElement = A.withObject "GetPassportElement" $ \o -> do
    password <- o A..:? "password"
    _type <- o A..:? "type"
    return $ GetPassportElement { password = password, _type = _type }