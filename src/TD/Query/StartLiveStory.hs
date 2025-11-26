module TD.Query.StartLiveStory
  (StartLiveStory(..)
  , defaultStartLiveStory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryPrivacySettings as StoryPrivacySettings

-- | Starts a new live story on behalf of a chat; requires can_post_stories administrator right for channel chats. Returns 'TD.Data.StartLiveStoryResult.StartLiveStoryResult'
data StartLiveStory
  = StartLiveStory
    { chat_id                 :: Maybe Int                                       -- ^ Identifier of the chat that will start the live story. Pass Saved Messages chat identifier when starting a live story on behalf of the current user, or a channel chat identifier
    , privacy_settings        :: Maybe StoryPrivacySettings.StoryPrivacySettings -- ^ The privacy settings for the story; ignored for stories posted on behalf of channel chats
    , protect_content         :: Maybe Bool                                      -- ^ Pass true if the content of the story must be protected from screenshotting
    , is_rtmp_stream          :: Maybe Bool                                      -- ^ Pass true to create an RTMP stream instead of an ordinary group call
    , enable_messages         :: Maybe Bool                                      -- ^ Pass true to allow viewers of the story to send messages
    , paid_message_star_count :: Maybe Int                                       -- ^ The minimum number of Telegram Stars that must be paid by viewers for each sent message to the call; 0-getOption("paid_group_call_message_star_count_max")
    }
  deriving (Eq, Show)

instance I.ShortShow StartLiveStory where
  shortShow
    StartLiveStory
      { chat_id                 = chat_id_
      , privacy_settings        = privacy_settings_
      , protect_content         = protect_content_
      , is_rtmp_stream          = is_rtmp_stream_
      , enable_messages         = enable_messages_
      , paid_message_star_count = paid_message_star_count_
      }
        = "StartLiveStory"
          ++ I.cc
          [ "chat_id"                 `I.p` chat_id_
          , "privacy_settings"        `I.p` privacy_settings_
          , "protect_content"         `I.p` protect_content_
          , "is_rtmp_stream"          `I.p` is_rtmp_stream_
          , "enable_messages"         `I.p` enable_messages_
          , "paid_message_star_count" `I.p` paid_message_star_count_
          ]

instance AT.ToJSON StartLiveStory where
  toJSON
    StartLiveStory
      { chat_id                 = chat_id_
      , privacy_settings        = privacy_settings_
      , protect_content         = protect_content_
      , is_rtmp_stream          = is_rtmp_stream_
      , enable_messages         = enable_messages_
      , paid_message_star_count = paid_message_star_count_
      }
        = A.object
          [ "@type"                   A..= AT.String "startLiveStory"
          , "chat_id"                 A..= chat_id_
          , "privacy_settings"        A..= privacy_settings_
          , "protect_content"         A..= protect_content_
          , "is_rtmp_stream"          A..= is_rtmp_stream_
          , "enable_messages"         A..= enable_messages_
          , "paid_message_star_count" A..= paid_message_star_count_
          ]

defaultStartLiveStory :: StartLiveStory
defaultStartLiveStory =
  StartLiveStory
    { chat_id                 = Nothing
    , privacy_settings        = Nothing
    , protect_content         = Nothing
    , is_rtmp_stream          = Nothing
    , enable_messages         = Nothing
    , paid_message_star_count = Nothing
    }

