-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveProxy where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Removes a proxy server. Can be called before authorization 
-- 
-- __proxy_id__ Proxy identifier
data RemoveProxy = 
 RemoveProxy { proxy_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON RemoveProxy where
 toJSON (RemoveProxy { proxy_id = proxy_id }) =
  A.object [ "@type" A..= T.String "removeProxy", "proxy_id" A..= proxy_id ]

instance T.FromJSON RemoveProxy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeProxy" -> parseRemoveProxy v
   _ -> mempty
  where
   parseRemoveProxy :: A.Value -> T.Parser RemoveProxy
   parseRemoveProxy = A.withObject "RemoveProxy" $ \o -> do
    proxy_id <- mconcat [ o A..:? "proxy_id", readMaybe <$> (o A..: "proxy_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ RemoveProxy { proxy_id = proxy_id }