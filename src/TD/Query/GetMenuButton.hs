{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetMenuButton where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns menu button set by the bot for the given user; for bots only @user_id Identifier of the user or 0 to get the default menu button
data GetMenuButton = GetMenuButton
  { -- |
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetMenuButton where
  show
    GetMenuButton
      { user_id = user_id_
      } =
      "GetMenuButton"
        ++ U.cc
          [ U.p "user_id" user_id_
          ]

instance T.ToJSON GetMenuButton where
  toJSON
    GetMenuButton
      { user_id = user_id_
      } =
      A.object
        [ "@type" A..= T.String "getMenuButton",
          "user_id" A..= user_id_
        ]
