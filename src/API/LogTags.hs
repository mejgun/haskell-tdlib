-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LogTags where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data LogTags = 
 LogTags { tags :: [String] }  -- deriving (Show)

instance T.ToJSON LogTags where
 toJSON (LogTags { tags = tags }) =
  A.object [ "@type" A..= T.String "logTags", "tags" A..= tags ]
-- logTags LogTags  { tags :: [String] } 

