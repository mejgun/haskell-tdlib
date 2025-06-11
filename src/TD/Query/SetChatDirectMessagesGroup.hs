module TD.Query.SetChatDirectMessagesGroup
  (SetChatDirectMessagesGroup(..)
  , defaultSetChatDirectMessagesGroup
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes direct messages group settings for a channel chat; requires owner privileges in the chat. Returns 'TD.Data.Ok.Ok'
data SetChatDirectMessagesGroup
  = SetChatDirectMessagesGroup
    { chat_id                 :: Maybe Int  -- ^ Identifier of the channel chat
    , is_enabled              :: Maybe Bool -- ^ Pass true if the direct messages group is enabled for the channel chat; pass false otherwise
    , paid_message_star_count :: Maybe Int  -- ^ The new number of Telegram Stars that must be paid for each message that is sent to the direct messages chat unless the sender is an administrator of the channel chat; 0-getOption("paid_message_star_count_max"). The channel will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending. Requires supergroupFullInfo.can_enable_paid_messages for positive amounts
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatDirectMessagesGroup where
  shortShow
    SetChatDirectMessagesGroup
      { chat_id                 = chat_id_
      , is_enabled              = is_enabled_
      , paid_message_star_count = paid_message_star_count_
      }
        = "SetChatDirectMessagesGroup"
          ++ I.cc
          [ "chat_id"                 `I.p` chat_id_
          , "is_enabled"              `I.p` is_enabled_
          , "paid_message_star_count" `I.p` paid_message_star_count_
          ]

instance AT.ToJSON SetChatDirectMessagesGroup where
  toJSON
    SetChatDirectMessagesGroup
      { chat_id                 = chat_id_
      , is_enabled              = is_enabled_
      , paid_message_star_count = paid_message_star_count_
      }
        = A.object
          [ "@type"                   A..= AT.String "setChatDirectMessagesGroup"
          , "chat_id"                 A..= chat_id_
          , "is_enabled"              A..= is_enabled_
          , "paid_message_star_count" A..= paid_message_star_count_
          ]

defaultSetChatDirectMessagesGroup :: SetChatDirectMessagesGroup
defaultSetChatDirectMessagesGroup =
  SetChatDirectMessagesGroup
    { chat_id                 = Nothing
    , is_enabled              = Nothing
    , paid_message_star_count = Nothing
    }

