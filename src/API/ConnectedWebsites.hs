-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ConnectedWebsites where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ConnectedWebsite as ConnectedWebsite

data ConnectedWebsites = 
 ConnectedWebsites { websites :: Maybe [ConnectedWebsite.ConnectedWebsite] }  deriving (Show, Eq)

instance T.ToJSON ConnectedWebsites where
 toJSON (ConnectedWebsites { websites = websites }) =
  A.object [ "@type" A..= T.String "connectedWebsites", "websites" A..= websites ]

instance T.FromJSON ConnectedWebsites where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "connectedWebsites" -> parseConnectedWebsites v
   _ -> mempty
  where
   parseConnectedWebsites :: A.Value -> T.Parser ConnectedWebsites
   parseConnectedWebsites = A.withObject "ConnectedWebsites" $ \o -> do
    websites <- o A..:? "websites"
    return $ ConnectedWebsites { websites = websites }