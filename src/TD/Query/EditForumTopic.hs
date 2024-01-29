module TD.Query.EditForumTopic
  (EditForumTopic(..)
  , defaultEditForumTopic
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Edits title and icon of a topic in a forum supergroup chat; requires can_manage_topics right in the supergroup unless the user is creator of the topic. Returns 'TD.Data.Ok.Ok'
data EditForumTopic
  = EditForumTopic
    { chat_id                :: Maybe Int    -- ^ Identifier of the chat
    , message_thread_id      :: Maybe Int    -- ^ Message thread identifier of the forum topic
    , name                   :: Maybe T.Text -- ^ New name of the topic; 0-128 characters. If empty, the previous topic name is kept
    , edit_icon_custom_emoji :: Maybe Bool   -- ^ Pass true to edit the icon of the topic. Icon of the General topic can't be edited
    , icon_custom_emoji_id   :: Maybe Int    -- ^ Identifier of the new custom emoji for topic icon; pass 0 to remove the custom emoji. Ignored if edit_icon_custom_emoji is false. Telegram Premium users can use any custom emoji, other users can use only a custom emoji returned by getForumTopicDefaultIcons
    }
  deriving (Eq, Show)

instance I.ShortShow EditForumTopic where
  shortShow
    EditForumTopic
      { chat_id                = chat_id_
      , message_thread_id      = message_thread_id_
      , name                   = name_
      , edit_icon_custom_emoji = edit_icon_custom_emoji_
      , icon_custom_emoji_id   = icon_custom_emoji_id_
      }
        = "EditForumTopic"
          ++ I.cc
          [ "chat_id"                `I.p` chat_id_
          , "message_thread_id"      `I.p` message_thread_id_
          , "name"                   `I.p` name_
          , "edit_icon_custom_emoji" `I.p` edit_icon_custom_emoji_
          , "icon_custom_emoji_id"   `I.p` icon_custom_emoji_id_
          ]

instance AT.ToJSON EditForumTopic where
  toJSON
    EditForumTopic
      { chat_id                = chat_id_
      , message_thread_id      = message_thread_id_
      , name                   = name_
      , edit_icon_custom_emoji = edit_icon_custom_emoji_
      , icon_custom_emoji_id   = icon_custom_emoji_id_
      }
        = A.object
          [ "@type"                  A..= AT.String "editForumTopic"
          , "chat_id"                A..= chat_id_
          , "message_thread_id"      A..= message_thread_id_
          , "name"                   A..= name_
          , "edit_icon_custom_emoji" A..= edit_icon_custom_emoji_
          , "icon_custom_emoji_id"   A..= fmap I.writeInt64  icon_custom_emoji_id_
          ]

defaultEditForumTopic :: EditForumTopic
defaultEditForumTopic =
  EditForumTopic
    { chat_id                = Nothing
    , message_thread_id      = Nothing
    , name                   = Nothing
    , edit_icon_custom_emoji = Nothing
    , icon_custom_emoji_id   = Nothing
    }

