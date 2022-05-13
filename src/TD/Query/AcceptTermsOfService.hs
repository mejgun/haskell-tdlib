{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AcceptTermsOfService where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Accepts Telegram terms of services @terms_of_service_id Terms of service identifier
data AcceptTermsOfService = AcceptTermsOfService
  { -- |
    terms_of_service_id :: Maybe String
  }
  deriving (Eq)

instance Show AcceptTermsOfService where
  show
    AcceptTermsOfService
      { terms_of_service_id = terms_of_service_id_
      } =
      "AcceptTermsOfService"
        ++ U.cc
          [ U.p "terms_of_service_id" terms_of_service_id_
          ]

instance T.ToJSON AcceptTermsOfService where
  toJSON
    AcceptTermsOfService
      { terms_of_service_id = terms_of_service_id_
      } =
      A.object
        [ "@type" A..= T.String "acceptTermsOfService",
          "terms_of_service_id" A..= terms_of_service_id_
        ]
