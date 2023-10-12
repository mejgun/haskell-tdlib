module TD.Data.ChatStatisticsMessageSenderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ChatStatisticsMessageSenderInfo
  = ChatStatisticsMessageSenderInfo -- ^ Contains statistics about messages sent by a user
    { user_id                 :: Maybe Int -- ^ User identifier
    , sent_message_count      :: Maybe Int -- ^ Number of sent messages
    , average_character_count :: Maybe Int -- ^ Average number of characters in sent messages; 0 if unknown
    }
  deriving (Eq)

instance Show ChatStatisticsMessageSenderInfo where
  show ChatStatisticsMessageSenderInfo
    { user_id                 = user_id_
    , sent_message_count      = sent_message_count_
    , average_character_count = average_character_count_
    }
      = "ChatStatisticsMessageSenderInfo"
        ++ I.cc
        [ "user_id"                 `I.p` user_id_
        , "sent_message_count"      `I.p` sent_message_count_
        , "average_character_count" `I.p` average_character_count_
        ]

instance AT.FromJSON ChatStatisticsMessageSenderInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatStatisticsMessageSenderInfo" -> parseChatStatisticsMessageSenderInfo v
      _                                 -> mempty
    
    where
      parseChatStatisticsMessageSenderInfo :: A.Value -> AT.Parser ChatStatisticsMessageSenderInfo
      parseChatStatisticsMessageSenderInfo = A.withObject "ChatStatisticsMessageSenderInfo" $ \o -> do
        user_id_                 <- o A..:?  "user_id"
        sent_message_count_      <- o A..:?  "sent_message_count"
        average_character_count_ <- o A..:?  "average_character_count"
        pure $ ChatStatisticsMessageSenderInfo
          { user_id                 = user_id_
          , sent_message_count      = sent_message_count_
          , average_character_count = average_character_count_
          }

instance AT.ToJSON ChatStatisticsMessageSenderInfo where
  toJSON ChatStatisticsMessageSenderInfo
    { user_id                 = user_id_
    , sent_message_count      = sent_message_count_
    , average_character_count = average_character_count_
    }
      = A.object
        [ "@type"                   A..= AT.String "chatStatisticsMessageSenderInfo"
        , "user_id"                 A..= user_id_
        , "sent_message_count"      A..= sent_message_count_
        , "average_character_count" A..= average_character_count_
        ]
