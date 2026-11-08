module TD.Query.EditMessageWidgetData
  (EditMessageWidgetData(..)
  , defaultEditMessageWidgetData
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Edits data of a widget sent by the bot; for bots only. Returns 'TD.Data.Ok.Ok'
data EditMessageWidgetData
  = EditMessageWidgetData
    { chat_id          :: Maybe Int    -- ^ The chat the message belongs to
    , message_id       :: Maybe Int    -- ^ Identifier of the widget message
    , edit_public_data :: Maybe Bool   -- ^ Pass true to edit public data of the widget
    , public_data      :: Maybe T.Text -- ^ New public data of the widget; ignored if edit_public_data is false
    , edit_chat_data   :: Maybe Bool   -- ^ Pass true to edit data of the widget, which is specific to the chat
    , chat_data        :: Maybe T.Text -- ^ New data of the widget, which is specific to the chat; ignored if edit_chat_data is false
    }
  deriving (Eq, Show)

instance I.ShortShow EditMessageWidgetData where
  shortShow
    EditMessageWidgetData
      { chat_id          = chat_id_
      , message_id       = message_id_
      , edit_public_data = edit_public_data_
      , public_data      = public_data_
      , edit_chat_data   = edit_chat_data_
      , chat_data        = chat_data_
      }
        = "EditMessageWidgetData"
          ++ I.cc
          [ "chat_id"          `I.p` chat_id_
          , "message_id"       `I.p` message_id_
          , "edit_public_data" `I.p` edit_public_data_
          , "public_data"      `I.p` public_data_
          , "edit_chat_data"   `I.p` edit_chat_data_
          , "chat_data"        `I.p` chat_data_
          ]

instance AT.ToJSON EditMessageWidgetData where
  toJSON
    EditMessageWidgetData
      { chat_id          = chat_id_
      , message_id       = message_id_
      , edit_public_data = edit_public_data_
      , public_data      = public_data_
      , edit_chat_data   = edit_chat_data_
      , chat_data        = chat_data_
      }
        = A.object
          [ "@type"            A..= AT.String "editMessageWidgetData"
          , "chat_id"          A..= chat_id_
          , "message_id"       A..= message_id_
          , "edit_public_data" A..= edit_public_data_
          , "public_data"      A..= public_data_
          , "edit_chat_data"   A..= edit_chat_data_
          , "chat_data"        A..= chat_data_
          ]

defaultEditMessageWidgetData :: EditMessageWidgetData
defaultEditMessageWidgetData =
  EditMessageWidgetData
    { chat_id          = Nothing
    , message_id       = Nothing
    , edit_public_data = Nothing
    , public_data      = Nothing
    , edit_chat_data   = Nothing
    , chat_data        = Nothing
    }

