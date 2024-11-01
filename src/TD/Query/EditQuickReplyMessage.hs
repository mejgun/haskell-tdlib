module TD.Query.EditQuickReplyMessage
  (EditQuickReplyMessage(..)
  , defaultEditQuickReplyMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Asynchronously edits the text, media or caption of a quick reply message. Use quickReplyMessage.can_be_edited to check whether a message can be edited. Media message can be edited only to a media message. The type of message content in an album can't be changed with exception of replacing a photo with a video or vice versa. Returns 'TD.Data.Ok.Ok'
data EditQuickReplyMessage
  = EditQuickReplyMessage
    { shortcut_id           :: Maybe Int                                     -- ^ Unique identifier of the quick reply shortcut with the message
    , message_id            :: Maybe Int                                     -- ^ Identifier of the message
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ New content of the message. Must be one of the following types: inputMessageText, inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
    }
  deriving (Eq, Show)

instance I.ShortShow EditQuickReplyMessage where
  shortShow
    EditQuickReplyMessage
      { shortcut_id           = shortcut_id_
      , message_id            = message_id_
      , input_message_content = input_message_content_
      }
        = "EditQuickReplyMessage"
          ++ I.cc
          [ "shortcut_id"           `I.p` shortcut_id_
          , "message_id"            `I.p` message_id_
          , "input_message_content" `I.p` input_message_content_
          ]

instance AT.ToJSON EditQuickReplyMessage where
  toJSON
    EditQuickReplyMessage
      { shortcut_id           = shortcut_id_
      , message_id            = message_id_
      , input_message_content = input_message_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "editQuickReplyMessage"
          , "shortcut_id"           A..= shortcut_id_
          , "message_id"            A..= message_id_
          , "input_message_content" A..= input_message_content_
          ]

defaultEditQuickReplyMessage :: EditQuickReplyMessage
defaultEditQuickReplyMessage =
  EditQuickReplyMessage
    { shortcut_id           = Nothing
    , message_id            = Nothing
    , input_message_content = Nothing
    }

