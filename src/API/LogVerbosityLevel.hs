-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LogVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data LogVerbosityLevel = 
 LogVerbosityLevel { verbosity_level :: Int }  -- deriving (Show)

instance T.ToJSON LogVerbosityLevel where
 toJSON (LogVerbosityLevel { verbosity_level = verbosity_level }) =
  A.object [ "@type" A..= T.String "logVerbosityLevel", "verbosity_level" A..= verbosity_level ]
-- logVerbosityLevel LogVerbosityLevel  { verbosity_level :: Int } 

