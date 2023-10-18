module TD.Query.GetPhoneNumberInfoSync
  (GetPhoneNumberInfoSync(..)
  , defaultGetPhoneNumberInfoSync
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about a phone number by its prefix synchronously. getCountries must be called at least once after changing localization to the specified language if properly localized country information is expected. Can be called synchronously. Returns 'TD.Data.PhoneNumberInfo.PhoneNumberInfo'
data GetPhoneNumberInfoSync
  = GetPhoneNumberInfoSync
    { language_code       :: Maybe T.Text -- ^ A two-letter ISO 639-1 language code for country information localization
    , phone_number_prefix :: Maybe T.Text -- ^ The phone number prefix
    }
  deriving (Eq, Show)

instance I.ShortShow GetPhoneNumberInfoSync where
  shortShow
    GetPhoneNumberInfoSync
      { language_code       = language_code_
      , phone_number_prefix = phone_number_prefix_
      }
        = "GetPhoneNumberInfoSync"
          ++ I.cc
          [ "language_code"       `I.p` language_code_
          , "phone_number_prefix" `I.p` phone_number_prefix_
          ]

instance AT.ToJSON GetPhoneNumberInfoSync where
  toJSON
    GetPhoneNumberInfoSync
      { language_code       = language_code_
      , phone_number_prefix = phone_number_prefix_
      }
        = A.object
          [ "@type"               A..= AT.String "getPhoneNumberInfoSync"
          , "language_code"       A..= language_code_
          , "phone_number_prefix" A..= phone_number_prefix_
          ]

defaultGetPhoneNumberInfoSync :: GetPhoneNumberInfoSync
defaultGetPhoneNumberInfoSync =
  GetPhoneNumberInfoSync
    { language_code       = Nothing
    , phone_number_prefix = Nothing
    }

