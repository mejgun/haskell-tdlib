{-# LANGUAGE OverloadedStrings #-}

module TD.Query.HideSuggestedAction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.SuggestedAction as SuggestedAction
import qualified Utils as U

-- |
-- Hides a suggested action @action Suggested action to hide
data HideSuggestedAction = HideSuggestedAction
  { -- |
    action :: Maybe SuggestedAction.SuggestedAction
  }
  deriving (Eq)

instance Show HideSuggestedAction where
  show
    HideSuggestedAction
      { action = action
      } =
      "HideSuggestedAction"
        ++ U.cc
          [ U.p "action" action
          ]

instance T.ToJSON HideSuggestedAction where
  toJSON
    HideSuggestedAction
      { action = action
      } =
      A.object
        [ "@type" A..= T.String "hideSuggestedAction",
          "action" A..= action
        ]
