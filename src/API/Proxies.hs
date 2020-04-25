-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Proxies where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Proxy as Proxy

data Proxies = 
 Proxies { proxies :: Maybe [Proxy.Proxy] }  deriving (Show, Eq)

instance T.ToJSON Proxies where
 toJSON (Proxies { proxies = proxies }) =
  A.object [ "@type" A..= T.String "proxies", "proxies" A..= proxies ]

instance T.FromJSON Proxies where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "proxies" -> parseProxies v
   _ -> mempty
  where
   parseProxies :: A.Value -> T.Parser Proxies
   parseProxies = A.withObject "Proxies" $ \o -> do
    proxies <- o A..:? "proxies"
    return $ Proxies { proxies = proxies }