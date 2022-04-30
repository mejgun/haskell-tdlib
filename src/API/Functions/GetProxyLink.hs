-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetProxyLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns an HTTPS link, which can be used to add a proxy. Available only for SOCKS5 and MTProto proxies. Can be called before authorization 
-- 
-- __proxy_id__ Proxy identifier
data GetProxyLink = 

 GetProxyLink { proxy_id :: Maybe Int }  deriving (Eq)

instance Show GetProxyLink where
 show GetProxyLink { proxy_id=proxy_id } =
  "GetProxyLink" ++ U.cc [U.p "proxy_id" proxy_id ]

instance T.ToJSON GetProxyLink where
 toJSON GetProxyLink { proxy_id = proxy_id } =
  A.object [ "@type" A..= T.String "getProxyLink", "proxy_id" A..= proxy_id ]

instance T.FromJSON GetProxyLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getProxyLink" -> parseGetProxyLink v
   _ -> mempty
  where
   parseGetProxyLink :: A.Value -> T.Parser GetProxyLink
   parseGetProxyLink = A.withObject "GetProxyLink" $ \o -> do
    proxy_id <- mconcat [ o A..:? "proxy_id", readMaybe <$> (o A..: "proxy_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetProxyLink { proxy_id = proxy_id }
 parseJSON _ = mempty
