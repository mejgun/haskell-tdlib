{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.HideSuggestedAction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.SuggestedAction as SuggestedAction
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
      { action = action_
      } =
      "HideSuggestedAction"
        ++ U.cc
          [ U.p "action" action_
          ]

instance T.ToJSON HideSuggestedAction where
  toJSON
    HideSuggestedAction
      { action = action_
      } =
      A.object
        [ "@type" A..= T.String "hideSuggestedAction",
          "action" A..= action_
        ]
