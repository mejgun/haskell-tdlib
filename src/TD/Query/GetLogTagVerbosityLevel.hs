{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetLogTagVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns current verbosity level for a specified TDLib internal log tag. Can be called synchronously @tag Logging tag to change verbosity level
data GetLogTagVerbosityLevel = GetLogTagVerbosityLevel
  { -- |
    tag :: Maybe String
  }
  deriving (Eq)

instance Show GetLogTagVerbosityLevel where
  show
    GetLogTagVerbosityLevel
      { tag = tag
      } =
      "GetLogTagVerbosityLevel"
        ++ U.cc
          [ U.p "tag" tag
          ]

instance T.ToJSON GetLogTagVerbosityLevel where
  toJSON
    GetLogTagVerbosityLevel
      { tag = tag
      } =
      A.object
        [ "@type" A..= T.String "getLogTagVerbosityLevel",
          "tag" A..= tag
        ]
