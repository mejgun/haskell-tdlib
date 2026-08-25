module TD.Query.SendRichMessageDraft
  (SendRichMessageDraft(..)
  , defaultSendRichMessageDraft
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputRichMessage as InputRichMessage

-- | Sends a draft for a being generated rich message; for bots only. Returns 'TD.Data.Ok.Ok'
data SendRichMessageDraft
  = SendRichMessageDraft
    { chat_id        :: Maybe Int                               -- ^ Chat identifier
    , forum_topic_id :: Maybe Int                               -- ^ The forum topic identifier in which the message will be sent; pass 0 if none
    , draft_id       :: Maybe Int                               -- ^ Unique identifier of the draft
    , can_stop       :: Maybe Bool                              -- ^ Pass true to show the user a button to stop further drafts
    , keep_on_stop   :: Maybe Bool                              -- ^ Pass true to keep the current draft when the user stops further generation
    , message        :: Maybe InputRichMessage.InputRichMessage -- ^ Draft of the message; file upload isn't supported
    }
  deriving (Eq, Show)

instance I.ShortShow SendRichMessageDraft where
  shortShow
    SendRichMessageDraft
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      , draft_id       = draft_id_
      , can_stop       = can_stop_
      , keep_on_stop   = keep_on_stop_
      , message        = message_
      }
        = "SendRichMessageDraft"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "forum_topic_id" `I.p` forum_topic_id_
          , "draft_id"       `I.p` draft_id_
          , "can_stop"       `I.p` can_stop_
          , "keep_on_stop"   `I.p` keep_on_stop_
          , "message"        `I.p` message_
          ]

instance AT.ToJSON SendRichMessageDraft where
  toJSON
    SendRichMessageDraft
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      , draft_id       = draft_id_
      , can_stop       = can_stop_
      , keep_on_stop   = keep_on_stop_
      , message        = message_
      }
        = A.object
          [ "@type"          A..= AT.String "sendRichMessageDraft"
          , "chat_id"        A..= chat_id_
          , "forum_topic_id" A..= forum_topic_id_
          , "draft_id"       A..= fmap I.writeInt64  draft_id_
          , "can_stop"       A..= can_stop_
          , "keep_on_stop"   A..= keep_on_stop_
          , "message"        A..= message_
          ]

defaultSendRichMessageDraft :: SendRichMessageDraft
defaultSendRichMessageDraft =
  SendRichMessageDraft
    { chat_id        = Nothing
    , forum_topic_id = Nothing
    , draft_id       = Nothing
    , can_stop       = Nothing
    , keep_on_stop   = Nothing
    , message        = Nothing
    }

