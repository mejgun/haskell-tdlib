-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TMeUrl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TMeUrlType as TMeUrlType

-- |
-- 
-- Represents a URL linking to an internal Telegram entity 
-- 
-- __url__ URL
-- 
-- __type__ Type of the URL
data TMeUrl = 

 TMeUrl { _type :: Maybe TMeUrlType.TMeUrlType, url :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON TMeUrl where
 toJSON (TMeUrl { _type = _type, url = url }) =
  A.object [ "@type" A..= T.String "tMeUrl", "type" A..= _type, "url" A..= url ]

instance T.FromJSON TMeUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "tMeUrl" -> parseTMeUrl v
   _ -> mempty
  where
   parseTMeUrl :: A.Value -> T.Parser TMeUrl
   parseTMeUrl = A.withObject "TMeUrl" $ \o -> do
    _type <- o A..:? "type"
    url <- o A..:? "url"
    return $ TMeUrl { _type = _type, url = url }