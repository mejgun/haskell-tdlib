-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCountryCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetCountryCode = 
 GetCountryCode deriving (Show, Eq)

instance T.ToJSON GetCountryCode where
 toJSON (GetCountryCode {  }) =
  A.object [ "@type" A..= T.String "getCountryCode" ]

instance T.FromJSON GetCountryCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getCountryCode" -> parseGetCountryCode v
   _ -> mempty
  where
   parseGetCountryCode :: A.Value -> T.Parser GetCountryCode
   parseGetCountryCode = A.withObject "GetCountryCode" $ \o -> do
    return $ GetCountryCode {  }