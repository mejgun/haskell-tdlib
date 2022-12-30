{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.FoundChatMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Message as Message
import qualified Utils as U

-- |
data FoundChatMessages = -- | Contains a list of messages found by a search in a given chat @total_count Approximate total number of messages found; -1 if unknown @messages List of messages @next_from_message_id The offset for the next request. If 0, there are no more results
  FoundChatMessages
  { -- |
    next_from_message_id :: Maybe Int,
    -- |
    messages :: Maybe [Message.Message],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show FoundChatMessages where
  show
    FoundChatMessages
      { next_from_message_id = next_from_message_id_,
        messages = messages_,
        total_count = total_count_
      } =
      "FoundChatMessages"
        ++ U.cc
          [ U.p "next_from_message_id" next_from_message_id_,
            U.p "messages" messages_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON FoundChatMessages where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "foundChatMessages" -> parseFoundChatMessages v
      _ -> mempty
    where
      parseFoundChatMessages :: A.Value -> T.Parser FoundChatMessages
      parseFoundChatMessages = A.withObject "FoundChatMessages" $ \o -> do
        next_from_message_id_ <- o A..:? "next_from_message_id"
        messages_ <- o A..:? "messages"
        total_count_ <- o A..:? "total_count"
        return $ FoundChatMessages {next_from_message_id = next_from_message_id_, messages = messages_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON FoundChatMessages where
  toJSON
    FoundChatMessages
      { next_from_message_id = next_from_message_id_,
        messages = messages_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "foundChatMessages",
          "next_from_message_id" A..= next_from_message_id_,
          "messages" A..= messages_,
          "total_count" A..= total_count_
        ]
