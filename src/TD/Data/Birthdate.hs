module TD.Data.Birthdate
  ( Birthdate(..)    
  , defaultBirthdate 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data Birthdate
  = Birthdate -- ^ Represents a birthdate of a user
    { day   :: Maybe Int -- ^ Day of the month; 1-31
    , month :: Maybe Int -- ^ Month of the year; 1-12
    , year  :: Maybe Int -- ^ Birth year; 0 if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow Birthdate where
  shortShow Birthdate
    { day   = day_
    , month = month_
    , year  = year_
    }
      = "Birthdate"
        ++ I.cc
        [ "day"   `I.p` day_
        , "month" `I.p` month_
        , "year"  `I.p` year_
        ]

instance AT.FromJSON Birthdate where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "birthdate" -> parseBirthdate v
      _           -> mempty
    
    where
      parseBirthdate :: A.Value -> AT.Parser Birthdate
      parseBirthdate = A.withObject "Birthdate" $ \o -> do
        day_   <- o A..:?  "day"
        month_ <- o A..:?  "month"
        year_  <- o A..:?  "year"
        pure $ Birthdate
          { day   = day_
          , month = month_
          , year  = year_
          }
  parseJSON _ = mempty

instance AT.ToJSON Birthdate where
  toJSON Birthdate
    { day   = day_
    , month = month_
    , year  = year_
    }
      = A.object
        [ "@type" A..= AT.String "birthdate"
        , "day"   A..= day_
        , "month" A..= month_
        , "year"  A..= year_
        ]

defaultBirthdate :: Birthdate
defaultBirthdate =
  Birthdate
    { day   = Nothing
    , month = Nothing
    , year  = Nothing
    }

