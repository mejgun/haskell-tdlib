module TD.Query.GetPhoneNumberInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetPhoneNumberInfo -- ^ Returns information about a phone number by its prefix. Can be called before authorization
  = GetPhoneNumberInfo
    { phone_number_prefix :: Maybe T.Text -- ^ The phone number prefix
    }
  deriving (Eq)

instance Show GetPhoneNumberInfo where
  show
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
