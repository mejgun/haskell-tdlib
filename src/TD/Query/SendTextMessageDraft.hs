module TD.Query.SendTextMessageDraft
  (SendTextMessageDraft(..)
  , defaultSendTextMessageDraft
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText

-- | Sends a draft for a being generated text message; for bots only. Returns 'TD.Data.Ok.Ok'
data SendTextMessageDraft
  = SendTextMessageDraft
    { chat_id        :: Maybe Int                         -- ^ Chat identifier
    , forum_topic_id :: Maybe Int                         -- ^ The forum topic identifier in which the message will be sent; pass 0 if none
    , draft_id       :: Maybe Int                         -- ^ Unique identifier of the draft
    , can_stop       :: Maybe Bool                        -- ^ Pass true to show the user a button to stop further drafts
    , keep_on_stop   :: Maybe Bool                        -- ^ Pass true to keep the current draft when the user stops further generation
    , text           :: Maybe FormattedText.FormattedText -- ^ Draft text of the message; pass null to show a "Thinking..." placeholder
    }
  deriving (Eq, Show)

instance I.ShortShow SendTextMessageDraft where
  shortShow
    SendTextMessageDraft
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      , draft_id       = draft_id_
      , can_stop       = can_stop_
      , keep_on_stop   = keep_on_stop_
      , text           = text_
      }
        = "SendTextMessageDraft"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "forum_topic_id" `I.p` forum_topic_id_
          , "draft_id"       `I.p` draft_id_
          , "can_stop"       `I.p` can_stop_
          , "keep_on_stop"   `I.p` keep_on_stop_
          , "text"           `I.p` text_
          ]

instance AT.ToJSON SendTextMessageDraft where
  toJSON
    SendTextMessageDraft
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      , draft_id       = draft_id_
      , can_stop       = can_stop_
      , keep_on_stop   = keep_on_stop_
      , text           = text_
      }
        = A.object
          [ "@type"          A..= AT.String "sendTextMessageDraft"
          , "chat_id"        A..= chat_id_
          , "forum_topic_id" A..= forum_topic_id_
          , "draft_id"       A..= fmap I.writeInt64  draft_id_
          , "can_stop"       A..= can_stop_
          , "keep_on_stop"   A..= keep_on_stop_
          , "text"           A..= text_
          ]

defaultSendTextMessageDraft :: SendTextMessageDraft
defaultSendTextMessageDraft =
  SendTextMessageDraft
    { chat_id        = Nothing
    , forum_topic_id = Nothing
    , draft_id       = Nothing
    , can_stop       = Nothing
    , keep_on_stop   = Nothing
    , text           = Nothing
    }

