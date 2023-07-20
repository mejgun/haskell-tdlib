{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReorderBotActiveUsernames where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes order of active usernames of a bot. Can be called only if userTypeBot.can_be_edited == true @bot_user_id Identifier of the target bot @usernames The new order of active usernames. All currently active usernames must be specified
data ReorderBotActiveUsernames = ReorderBotActiveUsernames
  { -- |
    usernames :: Maybe [String],
    -- |
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReorderBotActiveUsernames where
  show
    ReorderBotActiveUsernames
      { usernames = usernames_,
        bot_user_id = bot_user_id_
      } =
      "ReorderBotActiveUsernames"
        ++ U.cc
          [ U.p "usernames" usernames_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON ReorderBotActiveUsernames where
  toJSON
    ReorderBotActiveUsernames
      { usernames = usernames_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "reorderBotActiveUsernames",
          "usernames" A..= usernames_,
          "bot_user_id" A..= bot_user_id_
        ]
