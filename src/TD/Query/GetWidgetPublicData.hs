module TD.Query.GetWidgetPublicData
  (GetWidgetPublicData(..)
  , defaultGetWidgetPublicData
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the current public data of a widget. Must be called only if the widget is visible on the screen and asked to poll its public data. Returns 'TD.Data.WidgetPublicData.WidgetPublicData'
data GetWidgetPublicData
  = GetWidgetPublicData
    { chat_id    :: Maybe Int -- ^ Identifier of the chat with the message
    , message_id :: Maybe Int -- ^ Identifier of the widget message. The message must not be scheduled
    }
  deriving (Eq, Show)

instance I.ShortShow GetWidgetPublicData where
  shortShow
    GetWidgetPublicData
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetWidgetPublicData"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetWidgetPublicData where
  toJSON
    GetWidgetPublicData
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getWidgetPublicData"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetWidgetPublicData :: GetWidgetPublicData
defaultGetWidgetPublicData =
  GetWidgetPublicData
    { chat_id    = Nothing
    , message_id = Nothing
    }

