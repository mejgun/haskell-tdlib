-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchHashtags where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchHashtags = 
 SearchHashtags { limit :: Int, prefix :: String }  -- deriving (Show)

instance T.ToJSON SearchHashtags where
 toJSON (SearchHashtags { limit = limit, prefix = prefix }) =
  A.object [ "@type" A..= T.String "searchHashtags", "limit" A..= limit, "prefix" A..= prefix ]
-- searchHashtags SearchHashtags  { limit :: Int, prefix :: String } 

