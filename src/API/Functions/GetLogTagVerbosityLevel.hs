-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogTagVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLogTagVerbosityLevel = 
 GetLogTagVerbosityLevel { tag :: String }  -- deriving (Show)

instance T.ToJSON GetLogTagVerbosityLevel where
 toJSON (GetLogTagVerbosityLevel { tag = tag }) =
  A.object [ "@type" A..= T.String "getLogTagVerbosityLevel", "tag" A..= tag ]
-- getLogTagVerbosityLevel GetLogTagVerbosityLevel  { tag :: String } 

