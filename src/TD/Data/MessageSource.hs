module TD.Data.MessageSource where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data MessageSource -- ^ Describes source of a message
  = MessageSourceChatHistory -- ^ The message is from a chat history
  | MessageSourceMessageThreadHistory -- ^ The message is from a message thread history
  | MessageSourceForumTopicHistory -- ^ The message is from a forum topic history
  | MessageSourceHistoryPreview -- ^ The message is from chat, message thread or forum topic history preview
  | MessageSourceChatList -- ^ The message is from a chat list or a forum topic list
  | MessageSourceSearch -- ^ The message is from search results, including file downloads, local file list, outgoing document messages, calendar
  | MessageSourceChatEventLog -- ^ The message is from a chat event log
  | MessageSourceNotification -- ^ The message is from a notification
  | MessageSourceScreenshot -- ^ The message was screenshotted; the source must be used only if the message content was visible during the screenshot
  | MessageSourceOther -- ^ The message is from some other source
  deriving (Eq)

instance Show MessageSource where
  show MessageSourceChatHistory
      = "MessageSourceChatHistory"
  show MessageSourceMessageThreadHistory
      = "MessageSourceMessageThreadHistory"
  show MessageSourceForumTopicHistory
      = "MessageSourceForumTopicHistory"
  show MessageSourceHistoryPreview
      = "MessageSourceHistoryPreview"
  show MessageSourceChatList
      = "MessageSourceChatList"
  show MessageSourceSearch
      = "MessageSourceSearch"
  show MessageSourceChatEventLog
      = "MessageSourceChatEventLog"
  show MessageSourceNotification
      = "MessageSourceNotification"
  show MessageSourceScreenshot
      = "MessageSourceScreenshot"
  show MessageSourceOther
      = "MessageSourceOther"

instance AT.FromJSON MessageSource where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageSourceChatHistory"          -> pure MessageSourceChatHistory
      "messageSourceMessageThreadHistory" -> pure MessageSourceMessageThreadHistory
      "messageSourceForumTopicHistory"    -> pure MessageSourceForumTopicHistory
      "messageSourceHistoryPreview"       -> pure MessageSourceHistoryPreview
      "messageSourceChatList"             -> pure MessageSourceChatList
      "messageSourceSearch"               -> pure MessageSourceSearch
      "messageSourceChatEventLog"         -> pure MessageSourceChatEventLog
      "messageSourceNotification"         -> pure MessageSourceNotification
      "messageSourceScreenshot"           -> pure MessageSourceScreenshot
      "messageSourceOther"                -> pure MessageSourceOther
      _                                   -> mempty
    

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
