module TD.Query.AcceptTermsOfService where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data AcceptTermsOfService -- ^ Accepts Telegram terms of services
  = AcceptTermsOfService
    { terms_of_service_id :: Maybe T.Text -- ^ Terms of service identifier
    }
  deriving (Eq)

instance Show AcceptTermsOfService where
  show
    AcceptTermsOfService
      { terms_of_service_id = terms_of_service_id_
      }
        = "AcceptTermsOfService"
          ++ I.cc
          [ "terms_of_service_id" `I.p` terms_of_service_id_
          ]

instance AT.ToJSON AcceptTermsOfService where
  toJSON
    AcceptTermsOfService
      { terms_of_service_id = terms_of_service_id_
      }
        = A.object
          [ "@type"               A..= AT.String "acceptTermsOfService"
          , "terms_of_service_id" A..= terms_of_service_id_
          ]
