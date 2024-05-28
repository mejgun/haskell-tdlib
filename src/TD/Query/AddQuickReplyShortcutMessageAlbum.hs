module TD.Query.AddQuickReplyShortcutMessageAlbum
  (AddQuickReplyShortcutMessageAlbum(..)
  , defaultAddQuickReplyShortcutMessageAlbum
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputMessageContent as InputMessageContent

-- | Adds 2-10 messages grouped together into an album to a quick reply shortcut. Currently, only audio, document, photo and video messages can be grouped into an album. Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages. Returns 'TD.Data.QuickReplyMessages.QuickReplyMessages'
data AddQuickReplyShortcutMessageAlbum
  = AddQuickReplyShortcutMessageAlbum
    { shortcut_name          :: Maybe T.Text                                    -- ^ Name of the target shortcut
    , reply_to_message_id    :: Maybe Int                                       -- ^ Identifier of a quick reply message in the same shortcut to be replied; pass 0 if none
    , input_message_contents :: Maybe [InputMessageContent.InputMessageContent] -- ^ Contents of messages to be sent. At most 10 messages can be added to an album. All messages must have the same value of show_caption_above_media
    }
  deriving (Eq, Show)

instance I.ShortShow AddQuickReplyShortcutMessageAlbum where
  shortShow
    AddQuickReplyShortcutMessageAlbum
      { shortcut_name          = shortcut_name_
      , reply_to_message_id    = reply_to_message_id_
      , input_message_contents = input_message_contents_
      }
        = "AddQuickReplyShortcutMessageAlbum"
          ++ I.cc
          [ "shortcut_name"          `I.p` shortcut_name_
          , "reply_to_message_id"    `I.p` reply_to_message_id_
          , "input_message_contents" `I.p` input_message_contents_
          ]

instance AT.ToJSON AddQuickReplyShortcutMessageAlbum where
  toJSON
    AddQuickReplyShortcutMessageAlbum
      { shortcut_name          = shortcut_name_
      , reply_to_message_id    = reply_to_message_id_
      , input_message_contents = input_message_contents_
      }
        = A.object
          [ "@type"                  A..= AT.String "addQuickReplyShortcutMessageAlbum"
          , "shortcut_name"          A..= shortcut_name_
          , "reply_to_message_id"    A..= reply_to_message_id_
          , "input_message_contents" A..= input_message_contents_
          ]

defaultAddQuickReplyShortcutMessageAlbum :: AddQuickReplyShortcutMessageAlbum
defaultAddQuickReplyShortcutMessageAlbum =
  AddQuickReplyShortcutMessageAlbum
    { shortcut_name          = Nothing
    , reply_to_message_id    = Nothing
    , input_message_contents = Nothing
    }

