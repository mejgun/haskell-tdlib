{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetMessageSenderBlockList where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BlockList as BlockList
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Changes the block list of a message sender. Currently, only users and supergroup chats can be blocked
data SetMessageSenderBlockList = SetMessageSenderBlockList
  { -- | New block list for the message sender; pass null to unblock the message sender
    block_list :: Maybe BlockList.BlockList,
    -- | Identifier of a message sender to block/unblock
    sender_id :: Maybe MessageSender.MessageSender
  }
  deriving (Eq)

instance Show SetMessageSenderBlockList where
  show
    SetMessageSenderBlockList
      { block_list = block_list_,
        sender_id = sender_id_
      } =
      "SetMessageSenderBlockList"
        ++ U.cc
          [ U.p "block_list" block_list_,
            U.p "sender_id" sender_id_
          ]

instance T.ToJSON SetMessageSenderBlockList where
  toJSON
    SetMessageSenderBlockList
      { block_list = block_list_,
        sender_id = sender_id_
      } =
      A.object
        [ "@type" A..= T.String "setMessageSenderBlockList",
          "block_list" A..= block_list_,
          "sender_id" A..= sender_id_
        ]
