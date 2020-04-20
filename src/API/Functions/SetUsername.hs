-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetUsername where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetUsername = 
 SetUsername { username :: String }  -- deriving (Show)

instance T.ToJSON SetUsername where
 toJSON (SetUsername { username = username }) =
  A.object [ "@type" A..= T.String "setUsername", "username" A..= username ]
-- setUsername SetUsername  { username :: String } 

