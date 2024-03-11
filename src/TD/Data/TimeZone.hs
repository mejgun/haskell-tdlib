module TD.Data.TimeZone
  (TimeZone(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data TimeZone
  = TimeZone -- ^ Describes a time zone
    { _id             :: Maybe T.Text -- ^ Unique time zone identifier
    , name            :: Maybe T.Text -- ^ Time zone name
    , utc_time_offset :: Maybe Int    -- ^ Current UTC time offset for the time zone
    }
  deriving (Eq, Show)

instance I.ShortShow TimeZone where
  shortShow TimeZone
    { _id             = _id_
    , name            = name_
    , utc_time_offset = utc_time_offset_
    }
      = "TimeZone"
        ++ I.cc
        [ "_id"             `I.p` _id_
        , "name"            `I.p` name_
        , "utc_time_offset" `I.p` utc_time_offset_
        ]

instance AT.FromJSON TimeZone where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "timeZone" -> parseTimeZone v
      _          -> mempty
    
    where
      parseTimeZone :: A.Value -> AT.Parser TimeZone
      parseTimeZone = A.withObject "TimeZone" $ \o -> do
        _id_             <- o A..:?  "id"
        name_            <- o A..:?  "name"
        utc_time_offset_ <- o A..:?  "utc_time_offset"
        pure $ TimeZone
          { _id             = _id_
          , name            = name_
          , utc_time_offset = utc_time_offset_
          }
  parseJSON _ = mempty

