module TD.Query.SetChatDraftMessage
  (SetChatDraftMessage(..)
  , defaultSetChatDraftMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.DraftMessage as DraftMessage

-- | Changes the draft message in a chat. Returns 'TD.Data.Ok.Ok'
data SetChatDraftMessage
  = SetChatDraftMessage
    { chat_id           :: Maybe Int                       -- ^ Chat identifier
    , message_thread_id :: Maybe Int                       -- ^ If not 0, the message thread identifier in which the draft was changed
    , draft_message     :: Maybe DraftMessage.DraftMessage -- ^ New draft message; pass null to remove the draft. All files in draft message content must be of the type inputFileLocal. Media thumbnails and captions are ignored
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatDraftMessage where
  shortShow
    SetChatDraftMessage
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      , draft_message     = draft_message_
      }
        = "SetChatDraftMessage"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "message_thread_id" `I.p` message_thread_id_
          , "draft_message"     `I.p` draft_message_
          ]

instance AT.ToJSON SetChatDraftMessage where
  toJSON
    SetChatDraftMessage
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      , draft_message     = draft_message_
      }
        = A.object
          [ "@type"             A..= AT.String "setChatDraftMessage"
          , "chat_id"           A..= chat_id_
          , "message_thread_id" A..= message_thread_id_
          , "draft_message"     A..= draft_message_
          ]

defaultSetChatDraftMessage :: SetChatDraftMessage
defaultSetChatDraftMessage =
  SetChatDraftMessage
    { chat_id           = Nothing
    , message_thread_id = Nothing
    , draft_message     = Nothing
    }

