-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCountries where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns information about existing countries. Can be called before authorization
data GetCountries = 

 GetCountries deriving (Show, Eq)

instance T.ToJSON GetCountries where
 toJSON (GetCountries {  }) =
  A.object [ "@type" A..= T.String "getCountries" ]

instance T.FromJSON GetCountries where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getCountries" -> parseGetCountries v
   _ -> mempty
  where
   parseGetCountries :: A.Value -> T.Parser GetCountries
   parseGetCountries = A.withObject "GetCountries" $ \o -> do
    return $ GetCountries {  }