-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLogVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLogVerbosityLevel = 
 GetLogVerbosityLevel -- deriving (Show)

instance T.ToJSON GetLogVerbosityLevel where
 toJSON (GetLogVerbosityLevel {  }) =
  A.object [ "@type" A..= T.String "getLogVerbosityLevel" ]
-- getLogVerbosityLevel GetLogVerbosityLevel 

