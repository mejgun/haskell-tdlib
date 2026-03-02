module TD.Data.DateTimePartPrecision
  (DateTimePartPrecision(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes precision with which to show a date or a time
data DateTimePartPrecision
  = DateTimePartPrecisionNone -- ^ Don't show the date or time
  | DateTimePartPrecisionShort -- ^ Show the date or time in a short way (17.03.22 or 22:45)
  | DateTimePartPrecisionLong -- ^ Show the date or time in a long way (March 17, 2022 or 22:45:00)
  deriving (Eq, Show)

instance I.ShortShow DateTimePartPrecision where
  shortShow DateTimePartPrecisionNone
      = "DateTimePartPrecisionNone"
  shortShow DateTimePartPrecisionShort
      = "DateTimePartPrecisionShort"
  shortShow DateTimePartPrecisionLong
      = "DateTimePartPrecisionLong"

instance AT.FromJSON DateTimePartPrecision where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "dateTimePartPrecisionNone"  -> pure DateTimePartPrecisionNone
      "dateTimePartPrecisionShort" -> pure DateTimePartPrecisionShort
      "dateTimePartPrecisionLong"  -> pure DateTimePartPrecisionLong
      _                            -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON DateTimePartPrecision where
  toJSON DateTimePartPrecisionNone
      = A.object
        [ "@type" A..= AT.String "dateTimePartPrecisionNone"
        ]
  toJSON DateTimePartPrecisionShort
      = A.object
        [ "@type" A..= AT.String "dateTimePartPrecisionShort"
        ]
  toJSON DateTimePartPrecisionLong
      = A.object
        [ "@type" A..= AT.String "dateTimePartPrecisionLong"
        ]

