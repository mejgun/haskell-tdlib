-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EnableProxy where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data EnableProxy = 
 EnableProxy { proxy_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON EnableProxy where
 toJSON (EnableProxy { proxy_id = proxy_id }) =
  A.object [ "@type" A..= T.String "enableProxy", "proxy_id" A..= proxy_id ]

instance T.FromJSON EnableProxy where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "enableProxy" -> parseEnableProxy v
   _ -> mempty
  where
   parseEnableProxy :: A.Value -> T.Parser EnableProxy
   parseEnableProxy = A.withObject "EnableProxy" $ \o -> do
    proxy_id <- mconcat [ o A..:? "proxy_id", readMaybe <$> (o A..: "proxy_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ EnableProxy { proxy_id = proxy_id }