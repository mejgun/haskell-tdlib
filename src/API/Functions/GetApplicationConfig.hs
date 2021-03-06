-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetApplicationConfig where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns application config, provided by the server. Can be called before authorization
data GetApplicationConfig = 

 GetApplicationConfig deriving (Show, Eq)

instance T.ToJSON GetApplicationConfig where
 toJSON (GetApplicationConfig {  }) =
  A.object [ "@type" A..= T.String "getApplicationConfig" ]

instance T.FromJSON GetApplicationConfig where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getApplicationConfig" -> parseGetApplicationConfig v
   _ -> mempty
  where
   parseGetApplicationConfig :: A.Value -> T.Parser GetApplicationConfig
   parseGetApplicationConfig = A.withObject "GetApplicationConfig" $ \o -> do
    return $ GetApplicationConfig {  }