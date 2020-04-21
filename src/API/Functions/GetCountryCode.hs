-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCountryCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetCountryCode = 
 GetCountryCode deriving (Show)

instance T.ToJSON GetCountryCode where
 toJSON (GetCountryCode {  }) =
  A.object [ "@type" A..= T.String "getCountryCode" ]



instance T.FromJSON GetCountryCode where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getCountryCode" -> parseGetCountryCode v

   _ -> mempty ""
  where
   parseGetCountryCode :: A.Value -> T.Parser GetCountryCode
   parseGetCountryCode = A.withObject "GetCountryCode" $ \o -> do
    return $ GetCountryCode {  }