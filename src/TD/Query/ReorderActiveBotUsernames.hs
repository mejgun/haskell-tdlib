{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReorderActiveBotUsernames where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes order of active usernames of a bot. Can be called only if userTypeBot.can_be_edited == true @bot_user_id Identifier of the target bot @usernames The new order of active usernames. All currently active usernames must be specified
data ReorderActiveBotUsernames = ReorderActiveBotUsernames
  { -- |
    usernames :: Maybe [String],
    -- |
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReorderActiveBotUsernames where
  show
    ReorderActiveBotUsernames
      { usernames = usernames_,
        bot_user_id = bot_user_id_
      } =
      "ReorderActiveBotUsernames"
        ++ U.cc
          [ U.p "usernames" usernames_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON ReorderActiveBotUsernames where
  toJSON
    ReorderActiveBotUsernames
      { usernames = usernames_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "reorderActiveBotUsernames",
          "usernames" A..= usernames_,
          "bot_user_id" A..= bot_user_id_
        ]
