-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddLogMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data AddLogMessage = 
 AddLogMessage { text :: String, verbosity_level :: Int }  -- deriving (Show)

instance T.ToJSON AddLogMessage where
 toJSON (AddLogMessage { text = text, verbosity_level = verbosity_level }) =
  A.object [ "@type" A..= T.String "addLogMessage", "text" A..= text, "verbosity_level" A..= verbosity_level ]
-- addLogMessage AddLogMessage  { text :: String, verbosity_level :: Int } 

