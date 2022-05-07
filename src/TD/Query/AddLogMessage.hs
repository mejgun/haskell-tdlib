{-# LANGUAGE OverloadedStrings #-}

module TD.Query.AddLogMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Adds a message to TDLib internal log. Can be called synchronously
data AddLogMessage = AddLogMessage
  { -- |
    text :: Maybe String,
    -- | The minimum verbosity level needed for the message to be logged; 0-1023 @text Text of a message to log
    verbosity_level :: Maybe Int
  }
  deriving (Eq)

instance Show AddLogMessage where
  show
    AddLogMessage
      { text = text,
        verbosity_level = verbosity_level
      } =
      "AddLogMessage"
        ++ U.cc
          [ U.p "text" text,
            U.p "verbosity_level" verbosity_level
          ]

instance T.ToJSON AddLogMessage where
  toJSON
    AddLogMessage
      { text = text,
        verbosity_level = verbosity_level
      } =
      A.object
        [ "@type" A..= T.String "addLogMessage",
          "text" A..= text,
          "verbosity_level" A..= verbosity_level
        ]
