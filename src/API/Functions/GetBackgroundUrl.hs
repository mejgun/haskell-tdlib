-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetBackgroundUrl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BackgroundType as BackgroundType

-- |
-- 
-- Constructs a persistent HTTP URL for a background 
-- 
-- __name__ Background name
-- 
-- __type__ Background type
data GetBackgroundUrl = 

 GetBackgroundUrl { _type :: Maybe BackgroundType.BackgroundType, name :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetBackgroundUrl where
 toJSON (GetBackgroundUrl { _type = _type, name = name }) =
  A.object [ "@type" A..= T.String "getBackgroundUrl", "type" A..= _type, "name" A..= name ]

instance T.FromJSON GetBackgroundUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getBackgroundUrl" -> parseGetBackgroundUrl v
   _ -> mempty
  where
   parseGetBackgroundUrl :: A.Value -> T.Parser GetBackgroundUrl
   parseGetBackgroundUrl = A.withObject "GetBackgroundUrl" $ \o -> do
    _type <- o A..:? "type"
    name <- o A..:? "name"
    return $ GetBackgroundUrl { _type = _type, name = name }