module TD.Query.GetForumTopics
  (GetForumTopics(..)
  , defaultGetForumTopics
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns found forum topics in a forum chat. This is a temporary method for getting information about topic list from the server. Returns 'TD.Data.ForumTopics.ForumTopics'
data GetForumTopics
  = GetForumTopics
    { chat_id                  :: Maybe Int    -- ^ Identifier of the forum chat
    , query                    :: Maybe T.Text -- ^ Query to search for in the forum topic's name
    , offset_date              :: Maybe Int    -- ^ The date starting from which the results need to be fetched. Use 0 or any date in the future to get results from the last topic
    , offset_message_id        :: Maybe Int    -- ^ The message identifier of the last message in the last found topic, or 0 for the first request
    , offset_message_thread_id :: Maybe Int    -- ^ The message thread identifier of the last found topic, or 0 for the first request
    , limit                    :: Maybe Int    -- ^ The maximum number of forum topics to be returned; up to 100. For optimal performance, the number of returned forum topics is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetForumTopics where
  shortShow
    GetForumTopics
      { chat_id                  = chat_id_
      , query                    = query_
      , offset_date              = offset_date_
      , offset_message_id        = offset_message_id_
      , offset_message_thread_id = offset_message_thread_id_
      , limit                    = limit_
      }
        = "GetForumTopics"
          ++ I.cc
          [ "chat_id"                  `I.p` chat_id_
          , "query"                    `I.p` query_
          , "offset_date"              `I.p` offset_date_
          , "offset_message_id"        `I.p` offset_message_id_
          , "offset_message_thread_id" `I.p` offset_message_thread_id_
          , "limit"                    `I.p` limit_
          ]

instance AT.ToJSON GetForumTopics where
  toJSON
    GetForumTopics
      { chat_id                  = chat_id_
      , query                    = query_
      , offset_date              = offset_date_
      , offset_message_id        = offset_message_id_
      , offset_message_thread_id = offset_message_thread_id_
      , limit                    = limit_
      }
        = A.object
          [ "@type"                    A..= AT.String "getForumTopics"
          , "chat_id"                  A..= chat_id_
          , "query"                    A..= query_
          , "offset_date"              A..= offset_date_
          , "offset_message_id"        A..= offset_message_id_
          , "offset_message_thread_id" A..= offset_message_thread_id_
          , "limit"                    A..= limit_
          ]

defaultGetForumTopics :: GetForumTopics
defaultGetForumTopics =
  GetForumTopics
    { chat_id                  = Nothing
    , query                    = Nothing
    , offset_date              = Nothing
    , offset_message_id        = Nothing
    , offset_message_thread_id = Nothing
    , limit                    = Nothing
    }

