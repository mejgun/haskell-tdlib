-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetApplicationDownloadLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns the link for downloading official Telegram application to be used when the current user invites friends to Telegram
data GetApplicationDownloadLink = 

 GetApplicationDownloadLink deriving (Show, Eq)

instance T.ToJSON GetApplicationDownloadLink where
 toJSON (GetApplicationDownloadLink {  }) =
  A.object [ "@type" A..= T.String "getApplicationDownloadLink" ]

instance T.FromJSON GetApplicationDownloadLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getApplicationDownloadLink" -> parseGetApplicationDownloadLink v
   _ -> mempty
  where
   parseGetApplicationDownloadLink :: A.Value -> T.Parser GetApplicationDownloadLink
   parseGetApplicationDownloadLink = A.withObject "GetApplicationDownloadLink" $ \o -> do
    return $ GetApplicationDownloadLink {  }