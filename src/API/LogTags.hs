-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LogTags where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data LogTags = 
 LogTags { tags :: [String] }  deriving (Show)

instance T.ToJSON LogTags where
 toJSON (LogTags { tags = tags }) =
  A.object [ "@type" A..= T.String "logTags", "tags" A..= tags ]



instance T.FromJSON LogTags where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "logTags" -> parseLogTags v

   _ -> mempty ""
  where
   parseLogTags :: A.Value -> T.Parser LogTags
   parseLogTags = A.withObject "LogTags" $ \o -> do
    tags <- o A..: "tags"
    return $ LogTags { tags = tags }