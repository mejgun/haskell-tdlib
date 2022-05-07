{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ChatStatisticsMessageSenderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data ChatStatisticsMessageSenderInfo = -- | Contains statistics about messages sent by a user
  ChatStatisticsMessageSenderInfo
  { -- | Average number of characters in sent messages; 0 if unknown
    average_character_count :: Maybe Int,
    -- | Number of sent messages
    sent_message_count :: Maybe Int,
    -- | User identifier
    user_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatStatisticsMessageSenderInfo where
  show
    ChatStatisticsMessageSenderInfo
      { average_character_count = average_character_count,
        sent_message_count = sent_message_count,
        user_id = user_id
      } =
      "ChatStatisticsMessageSenderInfo"
        ++ U.cc
          [ U.p "average_character_count" average_character_count,
            U.p "sent_message_count" sent_message_count,
            U.p "user_id" user_id
          ]

instance T.FromJSON ChatStatisticsMessageSenderInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatStatisticsMessageSenderInfo" -> parseChatStatisticsMessageSenderInfo v
      _ -> mempty
    where
      parseChatStatisticsMessageSenderInfo :: A.Value -> T.Parser ChatStatisticsMessageSenderInfo
      parseChatStatisticsMessageSenderInfo = A.withObject "ChatStatisticsMessageSenderInfo" $ \o -> do
        average_character_count_ <- mconcat [o A..:? "average_character_count", U.rm <$> (o A..: "average_character_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        sent_message_count_ <- mconcat [o A..:? "sent_message_count", U.rm <$> (o A..: "sent_message_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ ChatStatisticsMessageSenderInfo {average_character_count = average_character_count_, sent_message_count = sent_message_count_, user_id = user_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatStatisticsMessageSenderInfo where
  toJSON
    ChatStatisticsMessageSenderInfo
      { average_character_count = average_character_count,
        sent_message_count = sent_message_count,
        user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "chatStatisticsMessageSenderInfo",
          "average_character_count" A..= average_character_count,
          "sent_message_count" A..= sent_message_count,
          "user_id" A..= user_id
        ]
