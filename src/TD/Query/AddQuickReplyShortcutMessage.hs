module TD.Query.AddQuickReplyShortcutMessage
  (AddQuickReplyShortcutMessage(..)
  , defaultAddQuickReplyShortcutMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Adds a message to a quick reply shortcut. If shortcut doesn't exist and there are less than getOption("quick_reply_shortcut_count_max") shortcuts, then a new shortcut is created. The shortcut must not contain more than getOption("quick_reply_shortcut_message_count_max") messages after adding the new message. Returns the added message. Returns 'TD.Data.QuickReplyMessage.QuickReplyMessage'
data AddQuickReplyShortcutMessage
  = AddQuickReplyShortcutMessage
    { shortcut_name         :: Maybe T.Text                                  -- ^ Name of the target shortcut
    , reply_to_message_id   :: Maybe Int                                     -- ^ Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none
    , input_message_content :: Maybe InputMessageContent.InputMessageContent -- ^ The content of the message to be added; inputMessagePoll, inputMessageForwarded and inputMessageLocation with live_period aren't supported
    }
  deriving (Eq, Show)

instance I.ShortShow AddQuickReplyShortcutMessage where
  shortShow
    AddQuickReplyShortcutMessage
      { shortcut_name         = shortcut_name_
      , reply_to_message_id   = reply_to_message_id_
      , input_message_content = input_message_content_
      }
        = "AddQuickReplyShortcutMessage"
          ++ I.cc
          [ "shortcut_name"         `I.p` shortcut_name_
          , "reply_to_message_id"   `I.p` reply_to_message_id_
          , "input_message_content" `I.p` input_message_content_
          ]

instance AT.ToJSON AddQuickReplyShortcutMessage where
  toJSON
    AddQuickReplyShortcutMessage
      { shortcut_name         = shortcut_name_
      , reply_to_message_id   = reply_to_message_id_
      , input_message_content = input_message_content_
      }
        = A.object
          [ "@type"                 A..= AT.String "addQuickReplyShortcutMessage"
          , "shortcut_name"         A..= shortcut_name_
          , "reply_to_message_id"   A..= reply_to_message_id_
          , "input_message_content" A..= input_message_content_
          ]

defaultAddQuickReplyShortcutMessage :: AddQuickReplyShortcutMessage
defaultAddQuickReplyShortcutMessage =
  AddQuickReplyShortcutMessage
    { shortcut_name         = Nothing
    , reply_to_message_id   = Nothing
    , input_message_content = Nothing
    }

