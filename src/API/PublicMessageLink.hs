-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PublicMessageLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PublicMessageLink = 
 PublicMessageLink { html :: String, link :: String }  -- deriving (Show)

instance T.ToJSON PublicMessageLink where
 toJSON (PublicMessageLink { html = html, link = link }) =
  A.object [ "@type" A..= T.String "publicMessageLink", "html" A..= html, "link" A..= link ]
-- publicMessageLink PublicMessageLink  { html :: String, link :: String } 



instance T.FromJSON PublicMessageLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "publicMessageLink" -> parsePublicMessageLink v
  where
   parsePublicMessageLink :: A.Value -> T.Parser PublicMessageLink
   parsePublicMessageLink = A.withObject "PublicMessageLink" $ \o -> do
    html <- o A..: "html"
    link <- o A..: "link"
    return $ PublicMessageLink { html = html, link = link }