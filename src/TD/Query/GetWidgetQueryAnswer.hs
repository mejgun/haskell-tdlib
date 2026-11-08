module TD.Query.GetWidgetQueryAnswer
  (GetWidgetQueryAnswer(..)
  , defaultGetWidgetQueryAnswer
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.WidgetQueryType as WidgetQueryType
import qualified Data.ByteString as BS

-- | Sends a widget query to a bot and returns an answer. Returns an error with code 502 if the bot fails to answer the query before the query timeout expires. Returns 'TD.Data.WidgetQueryAnswer.WidgetQueryAnswer'
data GetWidgetQueryAnswer
  = GetWidgetQueryAnswer
    { chat_id    :: Maybe Int                             -- ^ Identifier of the chat with the message
    , message_id :: Maybe Int                             -- ^ Identifier of the widget message from which the query originated. The message must not be scheduled
    , query_type :: Maybe WidgetQueryType.WidgetQueryType -- ^ Type of the query
    , _data      :: Maybe BS.ByteString                   -- ^ Data of the query
    }
  deriving (Eq, Show)

instance I.ShortShow GetWidgetQueryAnswer where
  shortShow
    GetWidgetQueryAnswer
      { chat_id    = chat_id_
      , message_id = message_id_
      , query_type = query_type_
      , _data      = _data_
      }
        = "GetWidgetQueryAnswer"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          , "query_type" `I.p` query_type_
          , "_data"      `I.p` _data_
          ]

instance AT.ToJSON GetWidgetQueryAnswer where
  toJSON
    GetWidgetQueryAnswer
      { chat_id    = chat_id_
      , message_id = message_id_
      , query_type = query_type_
      , _data      = _data_
      }
        = A.object
          [ "@type"      A..= AT.String "getWidgetQueryAnswer"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          , "query_type" A..= query_type_
          , "data"       A..= fmap I.writeBytes  _data_
          ]

defaultGetWidgetQueryAnswer :: GetWidgetQueryAnswer
defaultGetWidgetQueryAnswer =
  GetWidgetQueryAnswer
    { chat_id    = Nothing
    , message_id = Nothing
    , query_type = Nothing
    , _data      = Nothing
    }

