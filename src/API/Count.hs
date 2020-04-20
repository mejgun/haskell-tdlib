-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Count where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Count = 
 Count { count :: Int }  -- deriving (Show)

instance T.ToJSON Count where
 toJSON (Count { count = count }) =
  A.object [ "@type" A..= T.String "count", "count" A..= count ]
-- count Count  { count :: Int } 

