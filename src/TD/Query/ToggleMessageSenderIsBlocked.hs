module TD.Query.ToggleMessageSenderIsBlocked(ToggleMessageSenderIsBlocked(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data ToggleMessageSenderIsBlocked -- ^ Changes the block state of a message sender. Currently, only users and supergroup chats can be blocked
  = ToggleMessageSenderIsBlocked
    { sender_id  :: Maybe MessageSender.MessageSender -- ^ Identifier of a message sender to block/unblock
    , is_blocked :: Maybe Bool                        -- ^ New value of is_blocked
    }
  deriving (Eq)

instance Show ToggleMessageSenderIsBlocked where
  show
    ToggleMessageSenderIsBlocked
      { sender_id  = sender_id_
      , is_blocked = is_blocked_
      }
        = "ToggleMessageSenderIsBlocked"
          ++ I.cc
          [ "sender_id"  `I.p` sender_id_
          , "is_blocked" `I.p` is_blocked_
          ]

instance AT.ToJSON ToggleMessageSenderIsBlocked where
  toJSON
    ToggleMessageSenderIsBlocked
      { sender_id  = sender_id_
      , is_blocked = is_blocked_
      }
        = A.object
          [ "@type"      A..= AT.String "toggleMessageSenderIsBlocked"
          , "sender_id"  A..= sender_id_
          , "is_blocked" A..= is_blocked_
          ]
