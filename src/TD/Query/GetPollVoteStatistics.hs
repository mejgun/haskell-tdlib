module TD.Query.GetPollVoteStatistics
  (GetPollVoteStatistics(..)
  , defaultGetPollVoteStatistics
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns statistics of poll votes in a poll. Returns 'TD.Data.PollVoteStatistics.PollVoteStatistics'
data GetPollVoteStatistics
  = GetPollVoteStatistics
    { chat_id    :: Maybe Int  -- ^ Identifier of the chat to which the poll belongs
    , message_id :: Maybe Int  -- ^ Identifier of the message containing the poll. Use messageProperties.can_get_poll_vote_statistics to check whether the method can be used for a message
    , is_dark    :: Maybe Bool -- ^ Pass true if a dark theme is used by the application
    }
  deriving (Eq, Show)

instance I.ShortShow GetPollVoteStatistics where
  shortShow
    GetPollVoteStatistics
      { chat_id    = chat_id_
      , message_id = message_id_
      , is_dark    = is_dark_
      }
        = "GetPollVoteStatistics"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "is_dark"    `I.p` is_dark_
          ]

instance AT.ToJSON GetPollVoteStatistics where
  toJSON
    GetPollVoteStatistics
      { chat_id    = chat_id_
      , message_id = message_id_
      , is_dark    = is_dark_
      }
        = A.object
          [ "@type"      A..= AT.String "getPollVoteStatistics"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "is_dark"    A..= is_dark_
          ]

defaultGetPollVoteStatistics :: GetPollVoteStatistics
defaultGetPollVoteStatistics =
  GetPollVoteStatistics
    { chat_id    = Nothing
    , message_id = Nothing
    , is_dark    = Nothing
    }

