-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCountryCode where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Uses current user IP to found their country. Returns two-letter ISO 3166-1 alpha-2 country code. Can be called before authorization
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