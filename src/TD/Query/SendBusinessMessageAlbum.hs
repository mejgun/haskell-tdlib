module TD.Query.SendBusinessMessageAlbum
  (SendBusinessMessageAlbum(..)
  , defaultSendBusinessMessageAlbum
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputMessageReplyTo as InputMessageReplyTo
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Sends 2-10 messages grouped together into an album on behalf of a business account; for bots only. Currently, only audio, document, photo and video messages can be grouped into an album. Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages. Returns 'TD.Data.BusinessMessages.BusinessMessages'
data SendBusinessMessageAlbum
  = SendBusinessMessageAlbum
    { business_connection_id :: Maybe T.Text                                    -- ^ Unique identifier of business connection on behalf of which to send the request
    , chat_id                :: Maybe Int                                       -- ^ Target chat
    , reply_to               :: Maybe InputMessageReplyTo.InputMessageReplyTo   -- ^ Information about the message to be replied; pass null if none
    , disable_notification   :: Maybe Bool                                      -- ^ Pass true to disable notification for the message
    , protect_content        :: Maybe Bool                                      -- ^ Pass true if the content of the message must be protected from forwarding and saving
    , effect_id              :: Maybe Int                                       -- ^ Identifier of the effect to apply to the message
    , input_message_contents :: Maybe [InputMessageContent.InputMessageContent] -- ^ Contents of messages to be sent. At most 10 messages can be added to an album. All messages must have the same value of show_caption_above_media
    }
  deriving (Eq, Show)

instance I.ShortShow SendBusinessMessageAlbum where
  shortShow
    SendBusinessMessageAlbum
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , reply_to               = reply_to_
      , disable_notification   = disable_notification_
      , protect_content        = protect_content_
      , effect_id              = effect_id_
      , input_message_contents = input_message_contents_
      }
        = "SendBusinessMessageAlbum"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "chat_id"                `I.p` chat_id_
          , "reply_to"               `I.p` reply_to_
          , "disable_notification"   `I.p` disable_notification_
          , "protect_content"        `I.p` protect_content_
          , "effect_id"              `I.p` effect_id_
          , "input_message_contents" `I.p` input_message_contents_
          ]

instance AT.ToJSON SendBusinessMessageAlbum where
  toJSON
    SendBusinessMessageAlbum
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , reply_to               = reply_to_
      , disable_notification   = disable_notification_
      , protect_content        = protect_content_
      , effect_id              = effect_id_
      , input_message_contents = input_message_contents_
      }
        = A.object
          [ "@type"                  A..= AT.String "sendBusinessMessageAlbum"
          , "business_connection_id" A..= business_connection_id_
          , "chat_id"                A..= chat_id_
          , "reply_to"               A..= reply_to_
          , "disable_notification"   A..= disable_notification_
          , "protect_content"        A..= protect_content_
          , "effect_id"              A..= fmap I.writeInt64  effect_id_
          , "input_message_contents" A..= input_message_contents_
          ]

defaultSendBusinessMessageAlbum :: SendBusinessMessageAlbum
defaultSendBusinessMessageAlbum =
  SendBusinessMessageAlbum
    { business_connection_id = Nothing
    , chat_id                = Nothing
    , reply_to               = Nothing
    , disable_notification   = Nothing
    , protect_content        = Nothing
    , effect_id              = Nothing
    , input_message_contents = Nothing
    }

