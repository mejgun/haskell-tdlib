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

