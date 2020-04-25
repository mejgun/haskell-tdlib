-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetConnectedWebsites where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetConnectedWebsites = 
 GetConnectedWebsites deriving (Show, Eq)

instance T.ToJSON GetConnectedWebsites where
 toJSON (GetConnectedWebsites {  }) =
  A.object [ "@type" A..= T.String "getConnectedWebsites" ]

instance T.FromJSON GetConnectedWebsites where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getConnectedWebsites" -> parseGetConnectedWebsites v
   _ -> mempty
  where
   parseGetConnectedWebsites :: A.Value -> T.Parser GetConnectedWebsites
   parseGetConnectedWebsites = A.withObject "GetConnectedWebsites" $ \o -> do
    return $ GetConnectedWebsites {  }