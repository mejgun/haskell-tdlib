module TD.Query.EditWidgetData
  (EditWidgetData(..)
  , defaultEditWidgetData
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Edits public data of a shared widget created by the bot; for bots only. Returns 'TD.Data.Ok.Ok'
data EditWidgetData
  = EditWidgetData
    { widget_id   :: Maybe Int    -- ^ Identifier of the shared widget
    , public_data :: Maybe T.Text -- ^ New public data of the widget
    , cache_time  :: Maybe Int    -- ^ Time during which the public data can be cached, in seconds; 5-3600. Pass 0 to keep the current value, which is 30 by default
    }
  deriving (Eq, Show)

instance I.ShortShow EditWidgetData where
  shortShow
    EditWidgetData
      { widget_id   = widget_id_
      , public_data = public_data_
      , cache_time  = cache_time_
      }
        = "EditWidgetData"
          ++ I.cc
          [ "widget_id"   `I.p` widget_id_
          , "public_data" `I.p` public_data_
          , "cache_time"  `I.p` cache_time_
          ]

instance AT.ToJSON EditWidgetData where
  toJSON
    EditWidgetData
      { widget_id   = widget_id_
      , public_data = public_data_
      , cache_time  = cache_time_
      }
        = A.object
          [ "@type"       A..= AT.String "editWidgetData"
          , "widget_id"   A..= fmap I.writeInt64  widget_id_
          , "public_data" A..= public_data_
          , "cache_time"  A..= cache_time_
          ]

defaultEditWidgetData :: EditWidgetData
defaultEditWidgetData =
  EditWidgetData
    { widget_id   = Nothing
    , public_data = Nothing
    , cache_time  = Nothing
    }

