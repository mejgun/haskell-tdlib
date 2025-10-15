module TD.Query.SetChatDraftMessage
  (SetChatDraftMessage(..)
  , defaultSetChatDraftMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageTopic as MessageTopic
import qualified TD.Data.DraftMessage as DraftMessage

-- | Changes the draft message in a chat or a topic. Returns 'TD.Data.Ok.Ok'
data SetChatDraftMessage
  = SetChatDraftMessage
    { chat_id       :: Maybe Int                       -- ^ Chat identifier
    , topic_id      :: Maybe MessageTopic.MessageTopic -- ^ Topic in which the draft will be changed; pass null to change the draft for the chat itself
    , draft_message :: Maybe DraftMessage.DraftMessage -- ^ New draft message; pass null to remove the draft. All files in draft message content must be of the type inputFileLocal. Media thumbnails and captions are ignored
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatDraftMessage where
  shortShow
    SetChatDraftMessage
      { chat_id       = chat_id_
      , topic_id      = topic_id_
      , draft_message = draft_message_
      }
        = "SetChatDraftMessage"
          ++ I.cc
          [ "chat_id"       `I.p` chat_id_
          , "topic_id"      `I.p` topic_id_
          , "draft_message" `I.p` draft_message_
          ]

instance AT.ToJSON SetChatDraftMessage where
  toJSON
    SetChatDraftMessage
      { chat_id       = chat_id_
      , topic_id      = topic_id_
      , draft_message = draft_message_
      }
        = A.object
          [ "@type"         A..= AT.String "setChatDraftMessage"
          , "chat_id"       A..= chat_id_
          , "topic_id"      A..= topic_id_
          , "draft_message" A..= draft_message_
          ]

defaultSetChatDraftMessage :: SetChatDraftMessage
defaultSetChatDraftMessage =
  SetChatDraftMessage
    { chat_id       = Nothing
    , topic_id      = Nothing
    , draft_message = Nothing
    }

