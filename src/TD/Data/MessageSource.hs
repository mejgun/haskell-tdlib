module TD.Data.MessageSource
  (MessageSource(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes source of a message
data MessageSource
  = MessageSourceChatHistory -- ^ The message is from a chat history
  | MessageSourceMessageThreadHistory -- ^ The message is from history of a message thread
  | MessageSourceForumTopicHistory -- ^ The message is from history of a forum topic
  | MessageSourceDirectMessagesChatTopicHistory -- ^ The message is from history of a topic in a channel direct messages chat administered by the current user
  | MessageSourceHistoryPreview -- ^ The message is from chat, message thread or forum topic history preview
  | MessageSourceChatList -- ^ The message is from a chat list or a forum topic list
  | MessageSourceSearch -- ^ The message is from search results, including file downloads, local file list, outgoing document messages, calendar
  | MessageSourceChatEventLog -- ^ The message is from a chat event log
  | MessageSourceNotification -- ^ The message is from a notification
  | MessageSourceScreenshot -- ^ The message was screenshotted; the source must be used only if the message content was visible during the screenshot
  | MessageSourceOther -- ^ The message is from some other source
  deriving (Eq, Show)

instance I.ShortShow MessageSource where
  shortShow MessageSourceChatHistory
      = "MessageSourceChatHistory"
  shortShow MessageSourceMessageThreadHistory
      = "MessageSourceMessageThreadHistory"
  shortShow MessageSourceForumTopicHistory
      = "MessageSourceForumTopicHistory"
  shortShow MessageSourceDirectMessagesChatTopicHistory
      = "MessageSourceDirectMessagesChatTopicHistory"
  shortShow MessageSourceHistoryPreview
      = "MessageSourceHistoryPreview"
  shortShow MessageSourceChatList
      = "MessageSourceChatList"
  shortShow MessageSourceSearch
      = "MessageSourceSearch"
  shortShow MessageSourceChatEventLog
      = "MessageSourceChatEventLog"
  shortShow MessageSourceNotification
      = "MessageSourceNotification"
  shortShow MessageSourceScreenshot
      = "MessageSourceScreenshot"
  shortShow MessageSourceOther
      = "MessageSourceOther"

instance AT.FromJSON MessageSource where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageSourceChatHistory"                    -> pure MessageSourceChatHistory
      "messageSourceMessageThreadHistory"           -> pure MessageSourceMessageThreadHistory
      "messageSourceForumTopicHistory"              -> pure MessageSourceForumTopicHistory
      "messageSourceDirectMessagesChatTopicHistory" -> pure MessageSourceDirectMessagesChatTopicHistory
      "messageSourceHistoryPreview"                 -> pure MessageSourceHistoryPreview
      "messageSourceChatList"                       -> pure MessageSourceChatList
      "messageSourceSearch"                         -> pure MessageSourceSearch
      "messageSourceChatEventLog"                   -> pure MessageSourceChatEventLog
      "messageSourceNotification"                   -> pure MessageSourceNotification
      "messageSourceScreenshot"                     -> pure MessageSourceScreenshot
      "messageSourceOther"                          -> pure MessageSourceOther
      _                                             -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON MessageSource where
  toJSON MessageSourceChatHistory
      = A.object
        [ "@type" A..= AT.String "messageSourceChatHistory"
        ]
  toJSON MessageSourceMessageThreadHistory
      = A.object
        [ "@type" A..= AT.String "messageSourceMessageThreadHistory"
        ]
  toJSON MessageSourceForumTopicHistory
      = A.object
        [ "@type" A..= AT.String "messageSourceForumTopicHistory"
        ]
  toJSON MessageSourceDirectMessagesChatTopicHistory
      = A.object
        [ "@type" A..= AT.String "messageSourceDirectMessagesChatTopicHistory"
        ]
  toJSON MessageSourceHistoryPreview
      = A.object
        [ "@type" A..= AT.String "messageSourceHistoryPreview"
        ]
  toJSON MessageSourceChatList
      = A.object
        [ "@type" A..= AT.String "messageSourceChatList"
        ]
  toJSON MessageSourceSearch
      = A.object
        [ "@type" A..= AT.String "messageSourceSearch"
        ]
  toJSON MessageSourceChatEventLog
      = A.object
        [ "@type" A..= AT.String "messageSourceChatEventLog"
        ]
  toJSON MessageSourceNotification
      = A.object
        [ "@type" A..= AT.String "messageSourceNotification"
        ]
  toJSON MessageSourceScreenshot
      = A.object
        [ "@type" A..= AT.String "messageSourceScreenshot"
        ]
  toJSON MessageSourceOther
      = A.object
        [ "@type" A..= AT.String "messageSourceOther"
        ]

