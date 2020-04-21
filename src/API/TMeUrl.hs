-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TMeUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TMeUrlType as TMeUrlType

data TMeUrl = 
 TMeUrl { _type :: TMeUrlType.TMeUrlType, url :: String }  deriving (Show)

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
    _type <- o A..: "type"
    url <- o A..: "url"
    return $ TMeUrl { _type = _type, url = url }