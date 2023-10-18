module TD.Query.ReportStory
  (ReportStory(..)
  , defaultReportStory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ReportReason as ReportReason
import qualified Data.Text as T

-- | Reports a story to the Telegram moderators. Returns 'TD.Data.Ok.Ok'
data ReportStory
  = ReportStory
    { story_sender_chat_id :: Maybe Int                       -- ^ The identifier of the sender of the story to report
    , story_id             :: Maybe Int                       -- ^ The identifier of the story to report
    , reason               :: Maybe ReportReason.ReportReason -- ^ The reason for reporting the story
    , text                 :: Maybe T.Text                    -- ^ Additional report details; 0-1024 characters
    }
  deriving (Eq, Show)

instance I.ShortShow ReportStory where
  shortShow
    ReportStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , reason               = reason_
      , text                 = text_
      }
        = "ReportStory"
          ++ I.cc
          [ "story_sender_chat_id" `I.p` story_sender_chat_id_
          , "story_id"             `I.p` story_id_
          , "reason"               `I.p` reason_
          , "text"                 `I.p` text_
          ]

instance AT.ToJSON ReportStory where
  toJSON
    ReportStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , reason               = reason_
      , text                 = text_
      }
        = A.object
          [ "@type"                A..= AT.String "reportStory"
          , "story_sender_chat_id" A..= story_sender_chat_id_
          , "story_id"             A..= story_id_
          , "reason"               A..= reason_
          , "text"                 A..= text_
          ]

defaultReportStory :: ReportStory
defaultReportStory =
  ReportStory
    { story_sender_chat_id = Nothing
    , story_id             = Nothing
    , reason               = Nothing
    , text                 = Nothing
    }

