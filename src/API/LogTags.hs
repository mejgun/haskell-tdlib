-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LogTags where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Contains a list of available TDLib internal log tags 
-- 
-- __tags__ List of log tags
data LogTags = 

 LogTags { tags :: Maybe [String] }  deriving (Show, Eq)

instance T.ToJSON LogTags where
 toJSON (LogTags { tags = tags }) =
  A.object [ "@type" A..= T.String "logTags", "tags" A..= tags ]

instance T.FromJSON LogTags where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "logTags" -> parseLogTags v
   _ -> mempty
  where
   parseLogTags :: A.Value -> T.Parser LogTags
   parseLogTags = A.withObject "LogTags" $ \o -> do
    tags <- o A..:? "tags"
    return $ LogTags { tags = tags }