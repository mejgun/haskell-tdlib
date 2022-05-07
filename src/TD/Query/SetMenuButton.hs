{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetMenuButton where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.BotMenuButton as BotMenuButton
import qualified Utils as U

-- |
-- Sets menu button for the given user or for all users; for bots only
data SetMenuButton = SetMenuButton
  { -- | New menu button
    menu_button :: Maybe BotMenuButton.BotMenuButton,
    -- | Identifier of the user or 0 to set menu button for all users
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetMenuButton where
  show
    SetMenuButton
      { menu_button = menu_button,
        user_id = user_id
      } =
      "SetMenuButton"
        ++ U.cc
          [ U.p "menu_button" menu_button,
            U.p "user_id" user_id
          ]

instance T.ToJSON SetMenuButton where
  toJSON
    SetMenuButton
      { menu_button = menu_button,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "setMenuButton",
          "menu_button" A..= menu_button,
          "user_id" A..= user_id
        ]
