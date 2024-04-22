module TD.Query.AddQuickReplyShortcutInlineQueryResultMessage
  (AddQuickReplyShortcutInlineQueryResultMessage(..)
  , defaultAddQuickReplyShortcutInlineQueryResultMessage
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Adds a message to a quick reply shortcut via inline bot. If shortcut doesn't exist and there are less than getOption("quick_reply_shortcut_count_max") shortcuts, then a new shortcut is created. The shortcut must not contain more than getOption("quick_reply_shortcut_message_count_max") messages after adding the new message. Returns the added message. Returns 'TD.Data.QuickReplyMessage.QuickReplyMessage'
data AddQuickReplyShortcutInlineQueryResultMessage
  = AddQuickReplyShortcutInlineQueryResultMessage
    { shortcut_name       :: Maybe T.Text -- ^ Name of the target shortcut
    , reply_to_message_id :: Maybe Int    -- ^ Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none
    , query_id            :: Maybe Int    -- ^ Identifier of the inline query
    , result_id           :: Maybe T.Text -- ^ Identifier of the inline query result
    , hide_via_bot        :: Maybe Bool   -- ^ Pass true to hide the bot, via which the message is sent. Can be used only for bots getOption("animation_search_bot_username"), getOption("photo_search_bot_username"), and getOption("venue_search_bot_username")
    }
  deriving (Eq, Show)

instance I.ShortShow AddQuickReplyShortcutInlineQueryResultMessage where
  shortShow
    AddQuickReplyShortcutInlineQueryResultMessage
      { shortcut_name       = shortcut_name_
      , reply_to_message_id = reply_to_message_id_
      , query_id            = query_id_
      , result_id           = result_id_
      , hide_via_bot        = hide_via_bot_
      }
        = "AddQuickReplyShortcutInlineQueryResultMessage"
          ++ I.cc
          [ "shortcut_name"       `I.p` shortcut_name_
          , "reply_to_message_id" `I.p` reply_to_message_id_
          , "query_id"            `I.p` query_id_
          , "result_id"           `I.p` result_id_
          , "hide_via_bot"        `I.p` hide_via_bot_
          ]

instance AT.ToJSON AddQuickReplyShortcutInlineQueryResultMessage where
  toJSON
    AddQuickReplyShortcutInlineQueryResultMessage
      { shortcut_name       = shortcut_name_
      , reply_to_message_id = reply_to_message_id_
      , query_id            = query_id_
      , result_id           = result_id_
      , hide_via_bot        = hide_via_bot_
      }
        = A.object
          [ "@type"               A..= AT.String "addQuickReplyShortcutInlineQueryResultMessage"
          , "shortcut_name"       A..= shortcut_name_
          , "reply_to_message_id" A..= reply_to_message_id_
          , "query_id"            A..= fmap I.writeInt64  query_id_
          , "result_id"           A..= result_id_
          , "hide_via_bot"        A..= hide_via_bot_
          ]

defaultAddQuickReplyShortcutInlineQueryResultMessage :: AddQuickReplyShortcutInlineQueryResultMessage
defaultAddQuickReplyShortcutInlineQueryResultMessage =
  AddQuickReplyShortcutInlineQueryResultMessage
    { shortcut_name       = Nothing
    , reply_to_message_id = Nothing
    , query_id            = Nothing
    , result_id           = Nothing
    , hide_via_bot        = Nothing
    }

