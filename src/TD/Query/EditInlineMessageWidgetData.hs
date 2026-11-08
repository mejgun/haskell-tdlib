module TD.Query.EditInlineMessageWidgetData
  (EditInlineMessageWidgetData(..)
  , defaultEditInlineMessageWidgetData
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Edits data of a widget in an inline message sent via the bot; for bots only. Returns 'TD.Data.Ok.Ok'
data EditInlineMessageWidgetData
  = EditInlineMessageWidgetData
    { inline_message_id :: Maybe T.Text -- ^ Inline message identifier
    , edit_public_data  :: Maybe Bool   -- ^ Pass true to edit public data of the widget
    , public_data       :: Maybe T.Text -- ^ New public data of the widget; ignored if edit_public_data is false
    , edit_chat_data    :: Maybe Bool   -- ^ Pass true to edit data of the widget, which is specific to the chat
    , chat_data         :: Maybe T.Text -- ^ New data of the widget, which is specific to the chat; ignored if edit_chat_data is false
    }
  deriving (Eq, Show)

instance I.ShortShow EditInlineMessageWidgetData where
  shortShow
    EditInlineMessageWidgetData
      { inline_message_id = inline_message_id_
      , edit_public_data  = edit_public_data_
      , public_data       = public_data_
      , edit_chat_data    = edit_chat_data_
      , chat_data         = chat_data_
      }
        = "EditInlineMessageWidgetData"
          ++ I.cc
          [ "inline_message_id" `I.p` inline_message_id_
          , "edit_public_data"  `I.p` edit_public_data_
          , "public_data"       `I.p` public_data_
          , "edit_chat_data"    `I.p` edit_chat_data_
          , "chat_data"         `I.p` chat_data_
          ]

instance AT.ToJSON EditInlineMessageWidgetData where
  toJSON
    EditInlineMessageWidgetData
      { inline_message_id = inline_message_id_
      , edit_public_data  = edit_public_data_
      , public_data       = public_data_
      , edit_chat_data    = edit_chat_data_
      , chat_data         = chat_data_
      }
        = A.object
          [ "@type"             A..= AT.String "editInlineMessageWidgetData"
          , "inline_message_id" A..= inline_message_id_
          , "edit_public_data"  A..= edit_public_data_
          , "public_data"       A..= public_data_
          , "edit_chat_data"    A..= edit_chat_data_
          , "chat_data"         A..= chat_data_
          ]

defaultEditInlineMessageWidgetData :: EditInlineMessageWidgetData
defaultEditInlineMessageWidgetData =
  EditInlineMessageWidgetData
    { inline_message_id = Nothing
    , edit_public_data  = Nothing
    , public_data       = Nothing
    , edit_chat_data    = Nothing
    , chat_data         = Nothing
    }

