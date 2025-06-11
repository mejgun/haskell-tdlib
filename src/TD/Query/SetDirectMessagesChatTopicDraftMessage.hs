module TD.Query.SetDirectMessagesChatTopicDraftMessage
  (SetDirectMessagesChatTopicDraftMessage(..)
  , defaultSetDirectMessagesChatTopicDraftMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.DraftMessage as DraftMessage

-- | Changes the draft message in the topic in a channel direct messages chat administered by the current user. Returns 'TD.Data.Ok.Ok'
data SetDirectMessagesChatTopicDraftMessage
  = SetDirectMessagesChatTopicDraftMessage
    { chat_id       :: Maybe Int                       -- ^ Chat identifier
    , topic_id      :: Maybe Int                       -- ^ Topic identifier
    , draft_message :: Maybe DraftMessage.DraftMessage -- ^ New draft message; pass null to remove the draft. All files in draft message content must be of the type inputFileLocal. Media thumbnails and captions are ignored
    }
  deriving (Eq, Show)

instance I.ShortShow SetDirectMessagesChatTopicDraftMessage where
  shortShow
    SetDirectMessagesChatTopicDraftMessage
      { chat_id       = chat_id_
      , topic_id      = topic_id_
      , draft_message = draft_message_
      }
        = "SetDirectMessagesChatTopicDraftMessage"
          ++ I.cc
          [ "chat_id"       `I.p` chat_id_
          , "topic_id"      `I.p` topic_id_
          , "draft_message" `I.p` draft_message_
          ]

instance AT.ToJSON SetDirectMessagesChatTopicDraftMessage where
  toJSON
    SetDirectMessagesChatTopicDraftMessage
      { chat_id       = chat_id_
      , topic_id      = topic_id_
      , draft_message = draft_message_
      }
        = A.object
          [ "@type"         A..= AT.String "setDirectMessagesChatTopicDraftMessage"
          , "chat_id"       A..= chat_id_
          , "topic_id"      A..= topic_id_
          , "draft_message" A..= draft_message_
          ]

defaultSetDirectMessagesChatTopicDraftMessage :: SetDirectMessagesChatTopicDraftMessage
defaultSetDirectMessagesChatTopicDraftMessage =
  SetDirectMessagesChatTopicDraftMessage
    { chat_id       = Nothing
    , topic_id      = Nothing
    , draft_message = Nothing
    }

