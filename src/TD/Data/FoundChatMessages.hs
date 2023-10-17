module TD.Data.FoundChatMessages
  (FoundChatMessages(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Message as Message

data FoundChatMessages
  = FoundChatMessages -- ^ Contains a list of messages found by a search in a given chat
    { total_count          :: Maybe Int               -- ^ Approximate total number of messages found; -1 if unknown
    , messages             :: Maybe [Message.Message] -- ^ List of messages
    , next_from_message_id :: Maybe Int               -- ^ The offset for the next request. If 0, there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow FoundChatMessages where
  shortShow FoundChatMessages
    { total_count          = total_count_
    , messages             = messages_
    , next_from_message_id = next_from_message_id_
    }
      = "FoundChatMessages"
        ++ I.cc
        [ "total_count"          `I.p` total_count_
        , "messages"             `I.p` messages_
        , "next_from_message_id" `I.p` next_from_message_id_
        ]

instance AT.FromJSON FoundChatMessages where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "foundChatMessages" -> parseFoundChatMessages v
      _                   -> mempty
    
    where
      parseFoundChatMessages :: A.Value -> AT.Parser FoundChatMessages
      parseFoundChatMessages = A.withObject "FoundChatMessages" $ \o -> do
        total_count_          <- o A..:?  "total_count"
        messages_             <- o A..:?  "messages"
        next_from_message_id_ <- o A..:?  "next_from_message_id"
        pure $ FoundChatMessages
          { total_count          = total_count_
          , messages             = messages_
          , next_from_message_id = next_from_message_id_
          }
  parseJSON _ = mempty

