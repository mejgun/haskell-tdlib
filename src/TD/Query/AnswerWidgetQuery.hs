module TD.Query.AnswerWidgetQuery
  (AnswerWidgetQuery(..)
  , defaultAnswerWidgetQuery
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sets the result of a widget query; for bots only. Returns 'TD.Data.Ok.Ok'
data AnswerWidgetQuery
  = AnswerWidgetQuery
    { widget_query_id :: Maybe Int    -- ^ Identifier of the widget query
    , _data           :: Maybe T.Text -- ^ Data to be returned to the widget
    }
  deriving (Eq, Show)

instance I.ShortShow AnswerWidgetQuery where
  shortShow
    AnswerWidgetQuery
      { widget_query_id = widget_query_id_
      , _data           = _data_
      }
        = "AnswerWidgetQuery"
          ++ I.cc
          [ "widget_query_id" `I.p` widget_query_id_
          , "_data"           `I.p` _data_
          ]

instance AT.ToJSON AnswerWidgetQuery where
  toJSON
    AnswerWidgetQuery
      { widget_query_id = widget_query_id_
      , _data           = _data_
      }
        = A.object
          [ "@type"           A..= AT.String "answerWidgetQuery"
          , "widget_query_id" A..= fmap I.writeInt64  widget_query_id_
          , "data"            A..= _data_
          ]

defaultAnswerWidgetQuery :: AnswerWidgetQuery
defaultAnswerWidgetQuery =
  AnswerWidgetQuery
    { widget_query_id = Nothing
    , _data           = Nothing
    }

