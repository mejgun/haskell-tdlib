module TD.Data.QuickReplyMessage
  (QuickReplyMessage(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSendingState as MessageSendingState
import qualified TD.Data.MessageContent as MessageContent
import qualified TD.Data.ReplyMarkup as ReplyMarkup

data QuickReplyMessage
  = QuickReplyMessage -- ^ Describes a message that can be used for quick reply
    { _id                 :: Maybe Int                                     -- ^ Unique message identifier among all quick replies
    , sending_state       :: Maybe MessageSendingState.MessageSendingState -- ^ The sending state of the message; may be null if the message isn't being sent and didn't fail to be sent
    , can_be_edited       :: Maybe Bool                                    -- ^ True, if the message can be edited
    , reply_to_message_id :: Maybe Int                                     -- ^ The identifier of the quick reply message to which the message replies; 0 if none
    , via_bot_user_id     :: Maybe Int                                     -- ^ If non-zero, the user identifier of the bot through which this message was sent
    , media_album_id      :: Maybe Int                                     -- ^ Unique identifier of an album this message belongs to; 0 if none. Only audios, documents, photos and videos can be grouped together in albums
    , content             :: Maybe MessageContent.MessageContent           -- ^ Content of the message
    , reply_markup        :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ Inline keyboard reply markup for the message; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow QuickReplyMessage where
  shortShow QuickReplyMessage
    { _id                 = _id_
    , sending_state       = sending_state_
    , can_be_edited       = can_be_edited_
    , reply_to_message_id = reply_to_message_id_
    , via_bot_user_id     = via_bot_user_id_
    , media_album_id      = media_album_id_
    , content             = content_
    , reply_markup        = reply_markup_
    }
      = "QuickReplyMessage"
        ++ I.cc
        [ "_id"                 `I.p` _id_
        , "sending_state"       `I.p` sending_state_
        , "can_be_edited"       `I.p` can_be_edited_
        , "reply_to_message_id" `I.p` reply_to_message_id_
        , "via_bot_user_id"     `I.p` via_bot_user_id_
        , "media_album_id"      `I.p` media_album_id_
        , "content"             `I.p` content_
        , "reply_markup"        `I.p` reply_markup_
        ]

instance AT.FromJSON QuickReplyMessage where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "quickReplyMessage" -> parseQuickReplyMessage v
      _                   -> mempty
    
    where
      parseQuickReplyMessage :: A.Value -> AT.Parser QuickReplyMessage
      parseQuickReplyMessage = A.withObject "QuickReplyMessage" $ \o -> do
        _id_                 <- o A..:?                       "id"
        sending_state_       <- o A..:?                       "sending_state"
        can_be_edited_       <- o A..:?                       "can_be_edited"
        reply_to_message_id_ <- o A..:?                       "reply_to_message_id"
        via_bot_user_id_     <- o A..:?                       "via_bot_user_id"
        media_album_id_      <- fmap I.readInt64 <$> o A..:?  "media_album_id"
        content_             <- o A..:?                       "content"
        reply_markup_        <- o A..:?                       "reply_markup"
        pure $ QuickReplyMessage
          { _id                 = _id_
          , sending_state       = sending_state_
          , can_be_edited       = can_be_edited_
          , reply_to_message_id = reply_to_message_id_
          , via_bot_user_id     = via_bot_user_id_
          , media_album_id      = media_album_id_
          , content             = content_
          , reply_markup        = reply_markup_
          }
  parseJSON _ = mempty

