module TD.Query.SetChatPaidMessageStarCount
  (SetChatPaidMessageStarCount(..)
  , defaultSetChatPaidMessageStarCount
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the amount of Telegram Stars that must be paid to send a message to a supergroup chat; requires can_restrict_members administrator right and supergroupFullInfo.can_enable_paid_messages. Returns 'TD.Data.Ok.Ok'
data SetChatPaidMessageStarCount
  = SetChatPaidMessageStarCount
    { chat_id                 :: Maybe Int -- ^ Identifier of the supergroup chat
    , paid_message_star_count :: Maybe Int -- ^ The new number of Telegram Stars that must be paid for each message that is sent to the supergroup chat unless the sender is an administrator of the chat; 0-getOption("paid_message_star_count_max"). The supergroup will receive getOption("paid_message_earnings_per_mille") Telegram Stars for each 1000 Telegram Stars paid for message sending
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatPaidMessageStarCount where
  shortShow
    SetChatPaidMessageStarCount
      { chat_id                 = chat_id_
      , paid_message_star_count = paid_message_star_count_
      }
        = "SetChatPaidMessageStarCount"
          ++ I.cc
          [ "chat_id"                 `I.p` chat_id_
          , "paid_message_star_count" `I.p` paid_message_star_count_
          ]

instance AT.ToJSON SetChatPaidMessageStarCount where
  toJSON
    SetChatPaidMessageStarCount
      { chat_id                 = chat_id_
      , paid_message_star_count = paid_message_star_count_
      }
        = A.object
          [ "@type"                   A..= AT.String "setChatPaidMessageStarCount"
          , "chat_id"                 A..= chat_id_
          , "paid_message_star_count" A..= paid_message_star_count_
          ]

defaultSetChatPaidMessageStarCount :: SetChatPaidMessageStarCount
defaultSetChatPaidMessageStarCount =
  SetChatPaidMessageStarCount
    { chat_id                 = Nothing
    , paid_message_star_count = Nothing
    }

