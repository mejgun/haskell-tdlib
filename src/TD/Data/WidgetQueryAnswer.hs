module TD.Data.WidgetQueryAnswer
  (WidgetQueryAnswer(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data WidgetQueryAnswer
  = WidgetQueryAnswer -- ^ Contains an answer to a widget query
    { _data :: Maybe T.Text -- ^ Data returned by the bot
    }
  deriving (Eq, Show)

instance I.ShortShow WidgetQueryAnswer where
  shortShow WidgetQueryAnswer
    { _data = _data_
    }
      = "WidgetQueryAnswer"
        ++ I.cc
        [ "_data" `I.p` _data_
        ]

instance AT.FromJSON WidgetQueryAnswer where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "widgetQueryAnswer" -> parseWidgetQueryAnswer v
      _                   -> mempty
    
    where
      parseWidgetQueryAnswer :: A.Value -> AT.Parser WidgetQueryAnswer
      parseWidgetQueryAnswer = A.withObject "WidgetQueryAnswer" $ \o -> do
        _data_ <- o A..:?  "data"
        pure $ WidgetQueryAnswer
          { _data = _data_
          }
  parseJSON _ = mempty

