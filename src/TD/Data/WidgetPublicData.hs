module TD.Data.WidgetPublicData
  (WidgetPublicData(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data WidgetPublicData
  = WidgetPublicData -- ^ Contains public data of a widget
    { _data       :: Maybe T.Text -- ^ Public data of the widget
    , poll_period :: Maybe Int    -- ^ The number of seconds after which the public data can be polled again
    }
  deriving (Eq, Show)

instance I.ShortShow WidgetPublicData where
  shortShow WidgetPublicData
    { _data       = _data_
    , poll_period = poll_period_
    }
      = "WidgetPublicData"
        ++ I.cc
        [ "_data"       `I.p` _data_
        , "poll_period" `I.p` poll_period_
        ]

instance AT.FromJSON WidgetPublicData where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "widgetPublicData" -> parseWidgetPublicData v
      _                  -> mempty
    
    where
      parseWidgetPublicData :: A.Value -> AT.Parser WidgetPublicData
      parseWidgetPublicData = A.withObject "WidgetPublicData" $ \o -> do
        _data_       <- o A..:?  "data"
        poll_period_ <- o A..:?  "poll_period"
        pure $ WidgetPublicData
          { _data       = _data_
          , poll_period = poll_period_
          }
  parseJSON _ = mempty

