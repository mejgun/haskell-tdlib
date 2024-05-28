module TD.Query.SetApplicationVerificationToken
  (SetApplicationVerificationToken(..)
  , defaultSetApplicationVerificationToken
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Application verification has been completed. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data SetApplicationVerificationToken
  = SetApplicationVerificationToken
    { verification_id :: Maybe Int    -- ^ Unique identifier for the verification process as received from updateApplicationVerificationRequired
    , token           :: Maybe T.Text -- ^ Play Integrity API token for the Android application, or secret from push notification for the iOS application; pass an empty string to abort verification and receive error VERIFICATION_FAILED for the request
    }
  deriving (Eq, Show)

instance I.ShortShow SetApplicationVerificationToken where
  shortShow
    SetApplicationVerificationToken
      { verification_id = verification_id_
      , token           = token_
      }
        = "SetApplicationVerificationToken"
          ++ I.cc
          [ "verification_id" `I.p` verification_id_
          , "token"           `I.p` token_
          ]

instance AT.ToJSON SetApplicationVerificationToken where
  toJSON
    SetApplicationVerificationToken
      { verification_id = verification_id_
      , token           = token_
      }
        = A.object
          [ "@type"           A..= AT.String "setApplicationVerificationToken"
          , "verification_id" A..= verification_id_
          , "token"           A..= token_
          ]

defaultSetApplicationVerificationToken :: SetApplicationVerificationToken
defaultSetApplicationVerificationToken =
  SetApplicationVerificationToken
    { verification_id = Nothing
    , token           = Nothing
    }

