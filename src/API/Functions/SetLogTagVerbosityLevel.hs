-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetLogTagVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetLogTagVerbosityLevel = 
 SetLogTagVerbosityLevel { new_verbosity_level :: Int, tag :: String }  -- deriving (Show)

instance T.ToJSON SetLogTagVerbosityLevel where
 toJSON (SetLogTagVerbosityLevel { new_verbosity_level = new_verbosity_level, tag = tag }) =
  A.object [ "@type" A..= T.String "setLogTagVerbosityLevel", "new_verbosity_level" A..= new_verbosity_level, "tag" A..= tag ]
-- setLogTagVerbosityLevel SetLogTagVerbosityLevel  { new_verbosity_level :: Int, tag :: String } 

