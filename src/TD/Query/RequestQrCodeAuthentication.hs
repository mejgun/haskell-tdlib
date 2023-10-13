module TD.Query.RequestQrCodeAuthentication
  (RequestQrCodeAuthentication(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data RequestQrCodeAuthentication -- ^ Requests QR code authentication by scanning a QR code on another logged in device. Works only when the current authorization state is authorizationStateWaitPhoneNumber, or if there is no pending authentication query and the current authorization state is authorizationStateWaitEmailAddress, authorizationStateWaitEmailCode, authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword
  = RequestQrCodeAuthentication
    { other_user_ids :: Maybe [Int] -- ^ List of user identifiers of other users currently using the application
    }
  deriving (Eq)

instance Show RequestQrCodeAuthentication where
  show
    RequestQrCodeAuthentication
      { other_user_ids = other_user_ids_
      }
        = "RequestQrCodeAuthentication"
          ++ I.cc
          [ "other_user_ids" `I.p` other_user_ids_
          ]

instance AT.ToJSON RequestQrCodeAuthentication where
  toJSON
    RequestQrCodeAuthentication
      { other_user_ids = other_user_ids_
      }
        = A.object
          [ "@type"          A..= AT.String "requestQrCodeAuthentication"
          , "other_user_ids" A..= other_user_ids_
          ]

