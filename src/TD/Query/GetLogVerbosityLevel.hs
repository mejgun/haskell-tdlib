{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetLogVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns current verbosity level of the internal logging of TDLib. Can be called synchronously
data GetLogVerbosityLevel = GetLogVerbosityLevel
  {
  }
  deriving (Eq)

instance Show GetLogVerbosityLevel where
  show GetLogVerbosityLevel =
    "GetLogVerbosityLevel"
      ++ U.cc
        []

instance T.ToJSON GetLogVerbosityLevel where
  toJSON GetLogVerbosityLevel =
    A.object
      [ "@type" A..= T.String "getLogVerbosityLevel"
      ]
