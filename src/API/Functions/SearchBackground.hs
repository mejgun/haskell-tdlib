-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchBackground where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchBackground = 
 SearchBackground { name :: String }  -- deriving (Show)

instance T.ToJSON SearchBackground where
 toJSON (SearchBackground { name = name }) =
  A.object [ "@type" A..= T.String "searchBackground", "name" A..= name ]
-- searchBackground SearchBackground  { name :: String } 

