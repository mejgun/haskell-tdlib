-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogTags where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLogTags = 
 GetLogTags -- deriving (Show)

instance T.ToJSON GetLogTags where
 toJSON (GetLogTags {  }) =
  A.object [ "@type" A..= T.String "getLogTags" ]
-- getLogTags GetLogTags 

