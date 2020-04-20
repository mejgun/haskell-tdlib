-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetLogVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetLogVerbosityLevel = 
 SetLogVerbosityLevel { new_verbosity_level :: Int }  -- deriving (Show)

instance T.ToJSON SetLogVerbosityLevel where
 toJSON (SetLogVerbosityLevel { new_verbosity_level = new_verbosity_level }) =
  A.object [ "@type" A..= T.String "setLogVerbosityLevel", "new_verbosity_level" A..= new_verbosity_level ]
-- setLogVerbosityLevel SetLogVerbosityLevel  { new_verbosity_level :: Int } 

