module TD.Query.ToggleChatViewAsTopics
  (ToggleChatViewAsTopics(..)
  , defaultToggleChatViewAsTopics
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the view_as_topics setting of a forum chat or Saved Messages. Returns 'TD.Data.Ok.Ok'
data ToggleChatViewAsTopics
  = ToggleChatViewAsTopics
    { chat_id        :: Maybe Int  -- ^ Chat identifier
    , view_as_topics :: Maybe Bool -- ^ New value of view_as_topics
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleChatViewAsTopics where
  shortShow
    ToggleChatViewAsTopics
      { chat_id        = chat_id_
      , view_as_topics = view_as_topics_
      }
        = "ToggleChatViewAsTopics"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "view_as_topics" `I.p` view_as_topics_
          ]

instance AT.ToJSON ToggleChatViewAsTopics where
  toJSON
    ToggleChatViewAsTopics
      { chat_id        = chat_id_
      , view_as_topics = view_as_topics_
      }
        = A.object
          [ "@type"          A..= AT.String "toggleChatViewAsTopics"
          , "chat_id"        A..= chat_id_
          , "view_as_topics" A..= view_as_topics_
          ]

defaultToggleChatViewAsTopics :: ToggleChatViewAsTopics
defaultToggleChatViewAsTopics =
  ToggleChatViewAsTopics
    { chat_id        = Nothing
    , view_as_topics = Nothing
    }

