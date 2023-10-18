module TD.Query.SetMessageSenderBlockList
  (SetMessageSenderBlockList(..)
  , defaultSetMessageSenderBlockList
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.BlockList as BlockList

-- | Changes the block list of a message sender. Currently, only users and supergroup chats can be blocked. Returns 'TD.Data.Ok.Ok'
data SetMessageSenderBlockList
  = SetMessageSenderBlockList
    { sender_id  :: Maybe MessageSender.MessageSender -- ^ Identifier of a message sender to block/unblock
    , block_list :: Maybe BlockList.BlockList         -- ^ New block list for the message sender; pass null to unblock the message sender
    }
  deriving (Eq, Show)

instance I.ShortShow SetMessageSenderBlockList where
  shortShow
    SetMessageSenderBlockList
      { sender_id  = sender_id_
      , block_list = block_list_
      }
        = "SetMessageSenderBlockList"
          ++ I.cc
          [ "sender_id"  `I.p` sender_id_
          , "block_list" `I.p` block_list_
          ]

instance AT.ToJSON SetMessageSenderBlockList where
  toJSON
    SetMessageSenderBlockList
      { sender_id  = sender_id_
      , block_list = block_list_
      }
        = A.object
          [ "@type"      A..= AT.String "setMessageSenderBlockList"
          , "sender_id"  A..= sender_id_
          , "block_list" A..= block_list_
          ]

defaultSetMessageSenderBlockList :: SetMessageSenderBlockList
defaultSetMessageSenderBlockList =
  SetMessageSenderBlockList
    { sender_id  = Nothing
    , block_list = Nothing
    }

