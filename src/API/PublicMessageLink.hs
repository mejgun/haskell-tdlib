-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PublicMessageLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains a public HTTPS link to a message in a supergroup or channel with a username 
-- 
-- __link__ Message link
-- 
-- __html__ HTML-code for embedding the message
data PublicMessageLink = 

 PublicMessageLink { html :: Maybe String, link :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON PublicMessageLink where
 toJSON (PublicMessageLink { html = html, link = link }) =
  A.object [ "@type" A..= T.String "publicMessageLink", "html" A..= html, "link" A..= link ]

instance T.FromJSON PublicMessageLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "publicMessageLink" -> parsePublicMessageLink v
   _ -> mempty
  where
   parsePublicMessageLink :: A.Value -> T.Parser PublicMessageLink
   parsePublicMessageLink = A.withObject "PublicMessageLink" $ \o -> do
    html <- o A..:? "html"
    link <- o A..:? "link"
    return $ PublicMessageLink { html = html, link = link }