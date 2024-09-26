module TD.Query.SearchSavedMessages
  (SearchSavedMessages(..)
  , defaultSearchSavedMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReactionType as ReactionType
import qualified Data.Text as T

-- | Searches for messages tagged by the given reaction and with the given words in the Saved Messages chat; for Telegram Premium users only. Returns the results in reverse chronological order, i.e. in order of decreasing message_id. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit. Returns 'TD.Data.FoundChatMessages.FoundChatMessages'
data SearchSavedMessages
  = SearchSavedMessages
    { saved_messages_topic_id :: Maybe Int                       -- ^ If not 0, only messages in the specified Saved Messages topic will be considered; pass 0 to consider all messages
    , tag                     :: Maybe ReactionType.ReactionType -- ^ Tag to search for; pass null to return all suitable messages
    , query                   :: Maybe T.Text                    -- ^ Query to search for
    , from_message_id         :: Maybe Int                       -- ^ Identifier of the message starting from which messages must be fetched; use 0 to get results from the last message
    , offset                  :: Maybe Int                       -- ^ Specify 0 to get results from exactly the message from_message_id or a negative offset to get the specified message and some newer messages
    , limit                   :: Maybe Int                       -- ^ The maximum number of messages to be returned; must be positive and can't be greater than 100. If the offset is negative, the limit must be greater than -offset. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow SearchSavedMessages where
  shortShow
    SearchSavedMessages
      { saved_messages_topic_id = saved_messages_topic_id_
      , tag                     = tag_
      , query                   = query_
      , from_message_id         = from_message_id_
      , offset                  = offset_
      , limit                   = limit_
      }
        = "SearchSavedMessages"
          ++ I.cc
          [ "saved_messages_topic_id" `I.p` saved_messages_topic_id_
          , "tag"                     `I.p` tag_
          , "query"                   `I.p` query_
          , "from_message_id"         `I.p` from_message_id_
          , "offset"                  `I.p` offset_
          , "limit"                   `I.p` limit_
          ]

instance AT.ToJSON SearchSavedMessages where
  toJSON
    SearchSavedMessages
      { saved_messages_topic_id = saved_messages_topic_id_
      , tag                     = tag_
      , query                   = query_
      , from_message_id         = from_message_id_
      , offset                  = offset_
      , limit                   = limit_
      }
        = A.object
          [ "@type"                   A..= AT.String "searchSavedMessages"
          , "saved_messages_topic_id" A..= saved_messages_topic_id_
          , "tag"                     A..= tag_
          , "query"                   A..= query_
          , "from_message_id"         A..= from_message_id_
          , "offset"                  A..= offset_
          , "limit"                   A..= limit_
          ]

defaultSearchSavedMessages :: SearchSavedMessages
defaultSearchSavedMessages =
  SearchSavedMessages
    { saved_messages_topic_id = Nothing
    , tag                     = Nothing
    , query                   = Nothing
    , from_message_id         = Nothing
    , offset                  = Nothing
    , limit                   = Nothing
    }

