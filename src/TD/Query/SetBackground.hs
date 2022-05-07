{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetBackground where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.BackgroundType as BackgroundType
import qualified TD.Reply.InputBackground as InputBackground
import qualified Utils as U

-- |
-- Changes the background selected by the user; adds background to the list of installed backgrounds
data SetBackground = SetBackground
  { -- | Pass true if the background is changed for a dark theme
    for_dark_theme :: Maybe Bool,
    -- | Background type; pass null to use the default type of the remote background or to remove the current background
    _type :: Maybe BackgroundType.BackgroundType,
    -- | The input background to use; pass null to create a new filled backgrounds or to remove the current background
    background :: Maybe InputBackground.InputBackground
  }
  deriving (Eq)

instance Show SetBackground where
  show
    SetBackground
      { for_dark_theme = for_dark_theme,
        _type = _type,
        background = background
      } =
      "SetBackground"
        ++ U.cc
          [ U.p "for_dark_theme" for_dark_theme,
            U.p "_type" _type,
            U.p "background" background
          ]

instance T.ToJSON SetBackground where
  toJSON
    SetBackground
      { for_dark_theme = for_dark_theme,
        _type = _type,
        background = background
      } =
      A.object
        [ "@type" A..= T.String "setBackground",
          "for_dark_theme" A..= for_dark_theme,
          "type" A..= _type,
          "background" A..= background
        ]
