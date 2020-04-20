-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetOption = 
 GetOption { name :: String }  -- deriving (Show)

instance T.ToJSON GetOption where
 toJSON (GetOption { name = name }) =
  A.object [ "@type" A..= T.String "getOption", "name" A..= name ]
-- getOption GetOption  { name :: String } 

