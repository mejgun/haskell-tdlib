-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Proxies where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Proxy as Proxy

--main = putStrLn "ok"

data Proxies = 
 Proxies { proxies :: [Proxy.Proxy] }  -- deriving (Show)

instance T.ToJSON Proxies where
 toJSON (Proxies { proxies = proxies }) =
  A.object [ "@type" A..= T.String "proxies", "proxies" A..= proxies ]
-- proxies Proxies  { proxies :: [Proxy.Proxy] } 



instance T.FromJSON Proxies where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "proxies" -> parseProxies v
  where
   parseProxies :: A.Value -> T.Parser Proxies
   parseProxies = A.withObject "Proxies" $ \o -> do
    proxies <- o A..: "proxies"
    return $ Proxies { proxies = proxies }