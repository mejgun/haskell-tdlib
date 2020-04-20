-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Hashtags where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Hashtags = 
 Hashtags { hashtags :: [String] }  -- deriving (Show)

instance T.ToJSON Hashtags where
 toJSON (Hashtags { hashtags = hashtags }) =
  A.object [ "@type" A..= T.String "hashtags", "hashtags" A..= hashtags ]
-- hashtags Hashtags  { hashtags :: [String] } 



instance T.FromJSON Hashtags where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "hashtags" -> parseHashtags v
  where
   parseHashtags :: A.Value -> T.Parser Hashtags
   parseHashtags = A.withObject "Hashtags" $ \o -> do
    hashtags <- o A..: "hashtags"
    return $ Hashtags { hashtags = hashtags }