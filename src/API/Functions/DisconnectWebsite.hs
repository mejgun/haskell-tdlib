-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DisconnectWebsite where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data DisconnectWebsite = 
 DisconnectWebsite { website_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON DisconnectWebsite where
 toJSON (DisconnectWebsite { website_id = website_id }) =
  A.object [ "@type" A..= T.String "disconnectWebsite", "website_id" A..= website_id ]

instance T.FromJSON DisconnectWebsite where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "disconnectWebsite" -> parseDisconnectWebsite v
   _ -> mempty
  where
   parseDisconnectWebsite :: A.Value -> T.Parser DisconnectWebsite
   parseDisconnectWebsite = A.withObject "DisconnectWebsite" $ \o -> do
    website_id <- mconcat [ o A..:? "website_id", readMaybe <$> (o A..: "website_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DisconnectWebsite { website_id = website_id }