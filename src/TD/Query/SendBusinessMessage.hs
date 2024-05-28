module TD.Query.SendBusinessMessage
  (SendBusinessMessage(..)
  , defaultSendBusinessMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputMessageReplyTo as InputMessageReplyTo
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Sends a message on behalf of a business account; for bots only. Returns the message after it was sent. Returns 'TD.Data.BusinessMessage.BusinessMessage'
data SendBusinessMessage
  = SendBusinessMessage
    { business_connection_id :: Maybe T.Text                                  -- ^ Unique identifier of business connection on behalf of which to send the request
    , chat_id                :: Maybe Int                                     -- ^ Target chat
    , reply_to               :: Maybe InputMessageReplyTo.InputMessageReplyTo -- ^ Information about the message to be replied; pass null if none
    , disable_notification   :: Maybe Bool                                    -- ^ Pass true to disable notification for the message
    , protect_content        :: Maybe Bool                                    -- ^ Pass true if the content of the message must be protected from forwarding and saving
    , effect_id              :: Maybe Int                                     -- ^ Identifier of the effect to apply to the message
    , reply_markup           :: Maybe ReplyMarkup.ReplyMarkup                 -- ^ Markup for replying to the message; pass null if none
    , input_message_content  :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be sent
    }
  deriving (Eq, Show)

instance I.ShortShow SendBusinessMessage where
  shortShow
    SendBusinessMessage
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , reply_to               = reply_to_
      , disable_notification   = disable_notification_
      , protect_content        = protect_content_
      , effect_id              = effect_id_
      , reply_markup           = reply_markup_
      , input_message_content  = input_message_content_
      }
        = "SendBusinessMessage"
          ++ I.cc
          [ "business_connection_id" `I.p` business_connection_id_
          , "chat_id"                `I.p` chat_id_
          , "reply_to"               `I.p` reply_to_
          , "disable_notification"   `I.p` disable_notification_
          , "protect_content"        `I.p` protect_content_
          , "effect_id"              `I.p` effect_id_
          , "reply_markup"           `I.p` reply_markup_
          , "input_message_content"  `I.p` input_message_content_
          ]

instance AT.ToJSON SendBusinessMessage where
  toJSON
    SendBusinessMessage
      { business_connection_id = business_connection_id_
      , chat_id                = chat_id_
      , reply_to               = reply_to_
      , disable_notification   = disable_notification_
      , protect_content        = protect_content_
      , effect_id              = effect_id_
      , reply_markup           = reply_markup_
      , input_message_content  = input_message_content_
      }
        = A.object
          [ "@type"                  A..= AT.String "sendBusinessMessage"
          , "business_connection_id" A..= business_connection_id_
          , "chat_id"                A..= chat_id_
          , "reply_to"               A..= reply_to_
          , "disable_notification"   A..= disable_notification_
          , "protect_content"        A..= protect_content_
          , "effect_id"              A..= fmap I.writeInt64  effect_id_
          , "reply_markup"           A..= reply_markup_
          , "input_message_content"  A..= input_message_content_
          ]

defaultSendBusinessMessage :: SendBusinessMessage
defaultSendBusinessMessage =
  SendBusinessMessage
    { business_connection_id = Nothing
    , chat_id                = Nothing
    , reply_to               = Nothing
    , disable_notification   = Nothing
    , protect_content        = Nothing
    , effect_id              = Nothing
    , reply_markup           = Nothing
    , input_message_content  = Nothing
    }

