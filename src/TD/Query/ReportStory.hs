module TD.Query.ReportStory
  (ReportStory(..)
  , defaultReportStory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified Data.Text as T

-- | Reports a story to the Telegram moderators. Returns 'TD.Data.ReportStoryResult.ReportStoryResult'
data ReportStory
  = ReportStory
    { story_sender_chat_id :: Maybe Int           -- ^ The identifier of the sender of the story to report
    , story_id             :: Maybe Int           -- ^ The identifier of the story to report
    , option_id            :: Maybe BS.ByteString -- ^ Option identifier chosen by the user; leave empty for the initial request
    , text                 :: Maybe T.Text        -- ^ Additional report details; 0-1024 characters; leave empty for the initial request
    }
  deriving (Eq, Show)

instance I.ShortShow ReportStory where
  shortShow
    ReportStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , option_id            = option_id_
      , text                 = text_
      }
        = "ReportStory"
          ++ I.cc
          [ "story_sender_chat_id" `I.p` story_sender_chat_id_
          , "story_id"             `I.p` story_id_
          , "option_id"            `I.p` option_id_
          , "text"                 `I.p` text_
          ]

instance AT.ToJSON ReportStory where
  toJSON
    ReportStory
      { story_sender_chat_id = story_sender_chat_id_
      , story_id             = story_id_
      , option_id            = option_id_
      , text                 = text_
      }
        = A.object
          [ "@type"                A..= AT.String "reportStory"
          , "story_sender_chat_id" A..= story_sender_chat_id_
          , "story_id"             A..= story_id_
          , "option_id"            A..= fmap I.writeBytes  option_id_
          , "text"                 A..= text_
          ]

defaultReportStory :: ReportStory
defaultReportStory =
  ReportStory
    { story_sender_chat_id = Nothing
    , story_id             = Nothing
    , option_id            = Nothing
    , text                 = Nothing
    }

