module TD.Query.CreateForumTopic
  (CreateForumTopic(..)
  , defaultCreateForumTopic
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ForumTopicIcon as ForumTopicIcon

-- | Creates a topic in a forum supergroup chat; requires can_manage_topics administrator or can_create_topics member right in the supergroup. Returns 'TD.Data.ForumTopicInfo.ForumTopicInfo'
data CreateForumTopic
  = CreateForumTopic
    { chat_id :: Maybe Int                           -- ^ Identifier of the chat
    , name    :: Maybe T.Text                        -- ^ Name of the topic; 1-128 characters
    , icon    :: Maybe ForumTopicIcon.ForumTopicIcon -- ^ Icon of the topic. Icon color must be one of 0x6FB9F0, 0xFFD67E, 0xCB86DB, 0x8EEE98, 0xFF93B2, or 0xFB6F5F. Telegram Premium users can use any custom emoji as topic icon, other users can use only a custom emoji returned by getForumTopicDefaultIcons
    }
  deriving (Eq, Show)

instance I.ShortShow CreateForumTopic where
  shortShow
    CreateForumTopic
      { chat_id = chat_id_
      , name    = name_
      , icon    = icon_
      }
        = "CreateForumTopic"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "name"    `I.p` name_
          , "icon"    `I.p` icon_
          ]

instance AT.ToJSON CreateForumTopic where
  toJSON
    CreateForumTopic
      { chat_id = chat_id_
      , name    = name_
      , icon    = icon_
      }
        = A.object
          [ "@type"   A..= AT.String "createForumTopic"
          , "chat_id" A..= chat_id_
          , "name"    A..= name_
          , "icon"    A..= icon_
          ]

defaultCreateForumTopic :: CreateForumTopic
defaultCreateForumTopic =
  CreateForumTopic
    { chat_id = Nothing
    , name    = Nothing
    , icon    = Nothing
    }

