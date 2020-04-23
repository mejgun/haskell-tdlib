-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetProxyLink where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetProxyLink = 
 GetProxyLink { proxy_id :: Maybe Int }  deriving (Show)

instance T.ToJSON GetProxyLink where
 toJSON (GetProxyLink { proxy_id = proxy_id }) =
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
    proxy_id <- optional $ o A..: "proxy_id"
    return $ GetProxyLink { proxy_id = proxy_id }