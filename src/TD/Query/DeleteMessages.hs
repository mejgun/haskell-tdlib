{-# LANGUAGE OverloadedStrings #-}

module TD.Query.DeleteMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes messages @chat_id Chat identifier @message_ids Identifiers of the messages to be deleted @revoke Pass true to delete messages for all chat members. Always true for supergroups, channels and secret chats
data DeleteMessages = DeleteMessages
  { -- |
    revoke :: Maybe Bool,
    -- |
    message_ids :: Maybe [Int],
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteMessages where
  show
    DeleteMessages
      { revoke = revoke,
        message_ids = message_ids,
        chat_id = chat_id
      } =
      "DeleteMessages"
        ++ U.cc
          [ U.p "revoke" revoke,
            U.p "message_ids" message_ids,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON DeleteMessages where
  toJSON
    DeleteMessages
      { revoke = revoke,
        message_ids = message_ids,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "deleteMessages",
          "revoke" A..= revoke,
          "message_ids" A..= message_ids,
          "chat_id" A..= chat_id
        ]
