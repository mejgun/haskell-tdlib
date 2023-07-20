{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageSource where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes source of a message
data MessageSource
  = -- | The message is from a chat history
    MessageSourceChatHistory
  | -- | The message is from a message thread history
    MessageSourceMessageThreadHistory
  | -- | The message is from a forum topic history
    MessageSourceForumTopicHistory
  | -- | The message is from chat, message thread or forum topic history preview
    MessageSourceHistoryPreview
  | -- | The message is from a chat list or a forum topic list
    MessageSourceChatList
  | -- | The message is from search results, including file downloads, local file list, outgoing document messages, calendar
    MessageSourceSearch
  | -- | The message is from a chat event log
    MessageSourceChatEventLog
  | -- | The message is from a notification
    MessageSourceNotification
  | -- | The message was screenshotted; the source must be used only if the message content was visible during the screenshot
    MessageSourceScreenshot
  | -- | The message is from some other source
    MessageSourceOther
  deriving (Eq)

instance Show MessageSource where
  show MessageSourceChatHistory =
    "MessageSourceChatHistory"
      ++ U.cc
        []
  show MessageSourceMessageThreadHistory =
    "MessageSourceMessageThreadHistory"
      ++ U.cc
        []
  show MessageSourceForumTopicHistory =
    "MessageSourceForumTopicHistory"
      ++ U.cc
        []
  show MessageSourceHistoryPreview =
    "MessageSourceHistoryPreview"
      ++ U.cc
        []
  show MessageSourceChatList =
    "MessageSourceChatList"
      ++ U.cc
        []
  show MessageSourceSearch =
    "MessageSourceSearch"
      ++ U.cc
        []
  show MessageSourceChatEventLog =
    "MessageSourceChatEventLog"
      ++ U.cc
        []
  show MessageSourceNotification =
    "MessageSourceNotification"
      ++ U.cc
        []
  show MessageSourceScreenshot =
    "MessageSourceScreenshot"
      ++ U.cc
        []
  show MessageSourceOther =
    "MessageSourceOther"
      ++ U.cc
        []

instance T.FromJSON MessageSource where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageSourceChatHistory" -> parseMessageSourceChatHistory v
      "messageSourceMessageThreadHistory" -> parseMessageSourceMessageThreadHistory v
      "messageSourceForumTopicHistory" -> parseMessageSourceForumTopicHistory v
      "messageSourceHistoryPreview" -> parseMessageSourceHistoryPreview v
      "messageSourceChatList" -> parseMessageSourceChatList v
      "messageSourceSearch" -> parseMessageSourceSearch v
      "messageSourceChatEventLog" -> parseMessageSourceChatEventLog v
      "messageSourceNotification" -> parseMessageSourceNotification v
      "messageSourceScreenshot" -> parseMessageSourceScreenshot v
      "messageSourceOther" -> parseMessageSourceOther v
      _ -> mempty
    where
      parseMessageSourceChatHistory :: A.Value -> T.Parser MessageSource
      parseMessageSourceChatHistory = A.withObject "MessageSourceChatHistory" $ \_ -> return MessageSourceChatHistory

      parseMessageSourceMessageThreadHistory :: A.Value -> T.Parser MessageSource
      parseMessageSourceMessageThreadHistory = A.withObject "MessageSourceMessageThreadHistory" $ \_ -> return MessageSourceMessageThreadHistory

      parseMessageSourceForumTopicHistory :: A.Value -> T.Parser MessageSource
      parseMessageSourceForumTopicHistory = A.withObject "MessageSourceForumTopicHistory" $ \_ -> return MessageSourceForumTopicHistory

      parseMessageSourceHistoryPreview :: A.Value -> T.Parser MessageSource
      parseMessageSourceHistoryPreview = A.withObject "MessageSourceHistoryPreview" $ \_ -> return MessageSourceHistoryPreview

      parseMessageSourceChatList :: A.Value -> T.Parser MessageSource
      parseMessageSourceChatList = A.withObject "MessageSourceChatList" $ \_ -> return MessageSourceChatList

      parseMessageSourceSearch :: A.Value -> T.Parser MessageSource
      parseMessageSourceSearch = A.withObject "MessageSourceSearch" $ \_ -> return MessageSourceSearch

      parseMessageSourceChatEventLog :: A.Value -> T.Parser MessageSource
      parseMessageSourceChatEventLog = A.withObject "MessageSourceChatEventLog" $ \_ -> return MessageSourceChatEventLog

      parseMessageSourceNotification :: A.Value -> T.Parser MessageSource
      parseMessageSourceNotification = A.withObject "MessageSourceNotification" $ \_ -> return MessageSourceNotification

      parseMessageSourceScreenshot :: A.Value -> T.Parser MessageSource
      parseMessageSourceScreenshot = A.withObject "MessageSourceScreenshot" $ \_ -> return MessageSourceScreenshot

      parseMessageSourceOther :: A.Value -> T.Parser MessageSource
      parseMessageSourceOther = A.withObject "MessageSourceOther" $ \_ -> return MessageSourceOther
  parseJSON _ = mempty

instance T.ToJSON MessageSource where
  toJSON MessageSourceChatHistory =
    A.object
      [ "@type" A..= T.String "messageSourceChatHistory"
      ]
  toJSON MessageSourceMessageThreadHistory =
    A.object
      [ "@type" A..= T.String "messageSourceMessageThreadHistory"
      ]
  toJSON MessageSourceForumTopicHistory =
    A.object
      [ "@type" A..= T.String "messageSourceForumTopicHistory"
      ]
  toJSON MessageSourceHistoryPreview =
    A.object
      [ "@type" A..= T.String "messageSourceHistoryPreview"
      ]
  toJSON MessageSourceChatList =
    A.object
      [ "@type" A..= T.String "messageSourceChatList"
      ]
  toJSON MessageSourceSearch =
    A.object
      [ "@type" A..= T.String "messageSourceSearch"
      ]
  toJSON MessageSourceChatEventLog =
    A.object
      [ "@type" A..= T.String "messageSourceChatEventLog"
      ]
  toJSON MessageSourceNotification =
    A.object
      [ "@type" A..= T.String "messageSourceNotification"
      ]
  toJSON MessageSourceScreenshot =
    A.object
      [ "@type" A..= T.String "messageSourceScreenshot"
      ]
  toJSON MessageSourceOther =
    A.object
      [ "@type" A..= T.String "messageSourceOther"
      ]
