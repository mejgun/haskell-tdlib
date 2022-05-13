{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddChatMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Adds multiple new members to a chat. Currently, this method is only available for supergroups and channels. This method can't be used to join a chat. Members can't be added to a channel if it has more than 200 members
data AddChatMembers = AddChatMembers
  { -- |
    user_ids :: Maybe [Int],
    -- | Chat identifier @user_ids Identifiers of the users to be added to the chat. The maximum number of added users is 20 for supergroups and 100 for channels
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show AddChatMembers where
  show
    AddChatMembers
      { user_ids = user_ids_,
        chat_id = chat_id_
      } =
      "AddChatMembers"
        ++ U.cc
          [ U.p "user_ids" user_ids_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON AddChatMembers where
  toJSON
    AddChatMembers
      { user_ids = user_ids_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "addChatMembers",
          "user_ids" A..= user_ids_,
          "chat_id" A..= chat_id_
        ]
