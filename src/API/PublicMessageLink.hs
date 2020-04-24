-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PublicMessageLink where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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
    html <- optional $ o A..: "html"
    link <- optional $ o A..: "link"
    return $ PublicMessageLink { html = html, link = link }