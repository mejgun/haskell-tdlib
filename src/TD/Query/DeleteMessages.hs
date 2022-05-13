{-# LANGUAGE OverloadedStrings #-}

-- |
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
      { revoke = revoke_,
        message_ids = message_ids_,
        chat_id = chat_id_
      } =
      "DeleteMessages"
        ++ U.cc
          [ U.p "revoke" revoke_,
            U.p "message_ids" message_ids_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON DeleteMessages where
  toJSON
    DeleteMessages
      { revoke = revoke_,
        message_ids = message_ids_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "deleteMessages",
          "revoke" A..= revoke_,
          "message_ids" A..= message_ids_,
          "chat_id" A..= chat_id_
        ]
