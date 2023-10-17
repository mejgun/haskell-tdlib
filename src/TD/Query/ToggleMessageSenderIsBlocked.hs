module TD.Query.ToggleMessageSenderIsBlocked
  (ToggleMessageSenderIsBlocked(..)
  , defaultToggleMessageSenderIsBlocked
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Changes the block state of a message sender. Currently, only users and supergroup chats can be blocked
data ToggleMessageSenderIsBlocked
  = ToggleMessageSenderIsBlocked
    { sender_id  :: Maybe MessageSender.MessageSender -- ^ Identifier of a message sender to block/unblock
    , is_blocked :: Maybe Bool                        -- ^ New value of is_blocked
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleMessageSenderIsBlocked where
  shortShow
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

defaultToggleMessageSenderIsBlocked :: ToggleMessageSenderIsBlocked
defaultToggleMessageSenderIsBlocked =
  ToggleMessageSenderIsBlocked
    { sender_id  = Nothing
    , is_blocked = Nothing
    }

