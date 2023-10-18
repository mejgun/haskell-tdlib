module TD.Query.GetPhoneNumberInfo
  (GetPhoneNumberInfo(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about a phone number by its prefix. Can be called before authorization. Returns 'TD.Data.PhoneNumberInfo.PhoneNumberInfo'
data GetPhoneNumberInfo
  = GetPhoneNumberInfo
    { phone_number_prefix :: Maybe T.Text -- ^ The phone number prefix
    }
  deriving (Eq, Show)

instance I.ShortShow GetPhoneNumberInfo where
  shortShow
    GetPhoneNumberInfo
      { phone_number_prefix = phone_number_prefix_
      }
        = "GetPhoneNumberInfo"
          ++ I.cc
          [ "phone_number_prefix" `I.p` phone_number_prefix_
          ]

instance AT.ToJSON GetPhoneNumberInfo where
  toJSON
    GetPhoneNumberInfo
      { phone_number_prefix = phone_number_prefix_
      }
        = A.object
          [ "@type"               A..= AT.String "getPhoneNumberInfo"
          , "phone_number_prefix" A..= phone_number_prefix_
          ]

