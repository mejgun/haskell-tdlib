module TD.Query.StopPendingMessage
  (StopPendingMessage(..)
  , defaultStopPendingMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageTopic as MessageTopic

-- | Stops a pending message generation by a bot. Returns 'TD.Data.Ok.Ok'
data StopPendingMessage
  = StopPendingMessage
    { chat_id  :: Maybe Int                       -- ^ Identifier of the chat with the bot
    , topic_id :: Maybe MessageTopic.MessageTopic -- ^ Identifier of the topic in which the action is performed; pass null if none
    , draft_id :: Maybe Int                       -- ^ Unique identifier of the message draft within the message thread
    }
  deriving (Eq, Show)

instance I.ShortShow StopPendingMessage where
  shortShow
    StopPendingMessage
      { chat_id  = chat_id_
      , topic_id = topic_id_
      , draft_id = draft_id_
      }
        = "StopPendingMessage"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "topic_id" `I.p` topic_id_
          , "draft_id" `I.p` draft_id_
          ]

instance AT.ToJSON StopPendingMessage where
  toJSON
    StopPendingMessage
      { chat_id  = chat_id_
      , topic_id = topic_id_
      , draft_id = draft_id_
      }
        = A.object
          [ "@type"    A..= AT.String "stopPendingMessage"
          , "chat_id"  A..= chat_id_
          , "topic_id" A..= topic_id_
          , "draft_id" A..= fmap I.writeInt64  draft_id_
          ]

defaultStopPendingMessage :: StopPendingMessage
defaultStopPendingMessage =
  StopPendingMessage
    { chat_id  = Nothing
    , topic_id = Nothing
    , draft_id = Nothing
    }

