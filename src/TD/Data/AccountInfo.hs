module TD.Data.AccountInfo
  (AccountInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data AccountInfo
  = AccountInfo -- ^ Contains basic information about another user that started a chat with the current user
    { registration_month        :: Maybe Int    -- ^ Month when the user was registered in Telegram; 0-12; may be 0 if unknown
    , registration_year         :: Maybe Int    -- ^ Year when the user was registered in Telegram; 0-9999; may be 0 if unknown
    , phone_number_country_code :: Maybe T.Text -- ^ A two-letter ISO 3166-1 alpha-2 country code based on the phone number of the user; may be empty if unknown
    , last_name_change_date     :: Maybe Int    -- ^ Point in time (Unix timestamp) when the user changed name last time; 0 if unknown
    , last_photo_change_date    :: Maybe Int    -- ^ Point in time (Unix timestamp) when the user changed photo last time; 0 if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow AccountInfo where
  shortShow AccountInfo
    { registration_month        = registration_month_
    , registration_year         = registration_year_
    , phone_number_country_code = phone_number_country_code_
    , last_name_change_date     = last_name_change_date_
    , last_photo_change_date    = last_photo_change_date_
    }
      = "AccountInfo"
        ++ I.cc
        [ "registration_month"        `I.p` registration_month_
        , "registration_year"         `I.p` registration_year_
        , "phone_number_country_code" `I.p` phone_number_country_code_
        , "last_name_change_date"     `I.p` last_name_change_date_
        , "last_photo_change_date"    `I.p` last_photo_change_date_
        ]

instance AT.FromJSON AccountInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "accountInfo" -> parseAccountInfo v
      _             -> mempty
    
    where
      parseAccountInfo :: A.Value -> AT.Parser AccountInfo
      parseAccountInfo = A.withObject "AccountInfo" $ \o -> do
        registration_month_        <- o A..:?  "registration_month"
        registration_year_         <- o A..:?  "registration_year"
        phone_number_country_code_ <- o A..:?  "phone_number_country_code"
        last_name_change_date_     <- o A..:?  "last_name_change_date"
        last_photo_change_date_    <- o A..:?  "last_photo_change_date"
        pure $ AccountInfo
          { registration_month        = registration_month_
          , registration_year         = registration_year_
          , phone_number_country_code = phone_number_country_code_
          , last_name_change_date     = last_name_change_date_
          , last_photo_change_date    = last_photo_change_date_
          }
  parseJSON _ = mempty

