{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RequestQrCodeAuthentication where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Requests QR code authentication by scanning a QR code on another logged in device. Works only when the current authorization state is authorizationStateWaitPhoneNumber,
-- or if there is no pending authentication query and the current authorization state is authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword
data RequestQrCodeAuthentication = RequestQrCodeAuthentication
  { -- | List of user identifiers of other users currently using the application
    other_user_ids :: Maybe [Int]
  }
  deriving (Eq)

instance Show RequestQrCodeAuthentication where
  show
    RequestQrCodeAuthentication
      { other_user_ids = other_user_ids_
      } =
      "RequestQrCodeAuthentication"
        ++ U.cc
          [ U.p "other_user_ids" other_user_ids_
          ]

instance T.ToJSON RequestQrCodeAuthentication where
  toJSON
    RequestQrCodeAuthentication
      { other_user_ids = other_user_ids_
      } =
      A.object
        [ "@type" A..= T.String "requestQrCodeAuthentication",
          "other_user_ids" A..= other_user_ids_
        ]
