-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Hashtags where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains a list of hashtags 
-- 
-- __hashtags__ A list of hashtags
data Hashtags = 

 Hashtags { hashtags :: Maybe [String] }  deriving (Show, Eq)

instance T.ToJSON Hashtags where
 toJSON (Hashtags { hashtags = hashtags }) =
  A.object [ "@type" A..= T.String "hashtags", "hashtags" A..= hashtags ]

instance T.FromJSON Hashtags where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "hashtags" -> parseHashtags v
   _ -> mempty
  where
   parseHashtags :: A.Value -> T.Parser Hashtags
   parseHashtags = A.withObject "Hashtags" $ \o -> do
    hashtags <- o A..:? "hashtags"
    return $ Hashtags { hashtags = hashtags }