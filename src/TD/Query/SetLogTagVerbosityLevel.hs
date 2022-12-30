{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetLogTagVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets the verbosity level for a specified TDLib internal log tag. Can be called synchronously
data SetLogTagVerbosityLevel = SetLogTagVerbosityLevel
  { -- | New verbosity level; 1-1024
    new_verbosity_level :: Maybe Int,
    -- | Logging tag to change verbosity level
    tag :: Maybe String
  }
  deriving (Eq)

instance Show SetLogTagVerbosityLevel where
  show
    SetLogTagVerbosityLevel
      { new_verbosity_level = new_verbosity_level_,
        tag = tag_
      } =
      "SetLogTagVerbosityLevel"
        ++ U.cc
          [ U.p "new_verbosity_level" new_verbosity_level_,
            U.p "tag" tag_
          ]

instance T.ToJSON SetLogTagVerbosityLevel where
  toJSON
    SetLogTagVerbosityLevel
      { new_verbosity_level = new_verbosity_level_,
        tag = tag_
      } =
      A.object
        [ "@type" A..= T.String "setLogTagVerbosityLevel",
          "new_verbosity_level" A..= new_verbosity_level_,
          "tag" A..= tag_
        ]
