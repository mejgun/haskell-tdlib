{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetLogVerbosityLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets the verbosity level of the internal logging of TDLib. Can be called synchronously
data SetLogVerbosityLevel = SetLogVerbosityLevel
  { -- | New value of the verbosity level for logging. Value 0 corresponds to fatal errors, value 1 corresponds to errors, value 2 corresponds to warnings and debug warnings, value 3 corresponds to informational, value 4 corresponds to debug, value 5 corresponds to verbose debug, value greater than 5 and up to 1023 can be used to enable even more logging
    new_verbosity_level :: Maybe Int
  }
  deriving (Eq)

instance Show SetLogVerbosityLevel where
  show
    SetLogVerbosityLevel
      { new_verbosity_level = new_verbosity_level_
      } =
      "SetLogVerbosityLevel"
        ++ U.cc
          [ U.p "new_verbosity_level" new_verbosity_level_
          ]

instance T.ToJSON SetLogVerbosityLevel where
  toJSON
    SetLogVerbosityLevel
      { new_verbosity_level = new_verbosity_level_
      } =
      A.object
        [ "@type" A..= T.String "setLogVerbosityLevel",
          "new_verbosity_level" A..= new_verbosity_level_
        ]
