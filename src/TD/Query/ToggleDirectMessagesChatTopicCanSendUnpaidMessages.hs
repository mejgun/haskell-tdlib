module TD.Query.ToggleDirectMessagesChatTopicCanSendUnpaidMessages
  (ToggleDirectMessagesChatTopicCanSendUnpaidMessages(..)
  , defaultToggleDirectMessagesChatTopicCanSendUnpaidMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Allows to send unpaid messages to the given topic of the channel direct messages chat administered by the current user. Returns 'TD.Data.Ok.Ok'
data ToggleDirectMessagesChatTopicCanSendUnpaidMessages
  = ToggleDirectMessagesChatTopicCanSendUnpaidMessages
    { chat_id                  :: Maybe Int  -- ^ Chat identifier
    , topic_id                 :: Maybe Int  -- ^ Identifier of the topic
    , can_send_unpaid_messages :: Maybe Bool -- ^ Pass true to allow unpaid messages; pass false to disallow unpaid messages
    , refund_payments          :: Maybe Bool -- ^ Pass true to refund the user previously paid messages
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleDirectMessagesChatTopicCanSendUnpaidMessages where
  shortShow
    ToggleDirectMessagesChatTopicCanSendUnpaidMessages
      { chat_id                  = chat_id_
      , topic_id                 = topic_id_
      , can_send_unpaid_messages = can_send_unpaid_messages_
      , refund_payments          = refund_payments_
      }
        = "ToggleDirectMessagesChatTopicCanSendUnpaidMessages"
          ++ I.cc
          [ "chat_id"                  `I.p` chat_id_
          , "topic_id"                 `I.p` topic_id_
          , "can_send_unpaid_messages" `I.p` can_send_unpaid_messages_
          , "refund_payments"          `I.p` refund_payments_
          ]

instance AT.ToJSON ToggleDirectMessagesChatTopicCanSendUnpaidMessages where
  toJSON
    ToggleDirectMessagesChatTopicCanSendUnpaidMessages
      { chat_id                  = chat_id_
      , topic_id                 = topic_id_
      , can_send_unpaid_messages = can_send_unpaid_messages_
      , refund_payments          = refund_payments_
      }
        = A.object
          [ "@type"                    A..= AT.String "toggleDirectMessagesChatTopicCanSendUnpaidMessages"
          , "chat_id"                  A..= chat_id_
          , "topic_id"                 A..= topic_id_
          , "can_send_unpaid_messages" A..= can_send_unpaid_messages_
          , "refund_payments"          A..= refund_payments_
          ]

defaultToggleDirectMessagesChatTopicCanSendUnpaidMessages :: ToggleDirectMessagesChatTopicCanSendUnpaidMessages
defaultToggleDirectMessagesChatTopicCanSendUnpaidMessages =
  ToggleDirectMessagesChatTopicCanSendUnpaidMessages
    { chat_id                  = Nothing
    , topic_id                 = Nothing
    , can_send_unpaid_messages = Nothing
    , refund_payments          = Nothing
    }

