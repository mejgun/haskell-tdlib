{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetLogTagVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets the verbosity level for a specified TDLib internal log tag. Can be called synchronously
data SetLogTagVerbosityLevel = SetLogTagVerbosityLevel
  { -- |
    new_verbosity_level :: Maybe Int,
    -- | Logging tag to change verbosity level @new_verbosity_level New verbosity level; 1-1024
    tag :: Maybe String
  }
  deriving (Eq)

instance Show SetLogTagVerbosityLevel where
  show
    SetLogTagVerbosityLevel
      { new_verbosity_level = new_verbosity_level,
        tag = tag
      } =
      "SetLogTagVerbosityLevel"
        ++ U.cc
          [ U.p "new_verbosity_level" new_verbosity_level,
            U.p "tag" tag
          ]

instance T.ToJSON SetLogTagVerbosityLevel where
  toJSON
    SetLogTagVerbosityLevel
      { new_verbosity_level = new_verbosity_level,
        tag = tag
      } =
      A.object
        [ "@type" A..= T.String "setLogTagVerbosityLevel",
          "new_verbosity_level" A..= new_verbosity_level,
          "tag" A..= tag
        ]
