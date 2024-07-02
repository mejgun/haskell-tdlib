module TD.Data.FirebaseDeviceVerificationParameters
  (FirebaseDeviceVerificationParameters(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified Data.Text as T

-- | Describes parameters to be used for device verification
data FirebaseDeviceVerificationParameters
  = FirebaseDeviceVerificationParametersSafetyNet -- ^ Device verification must be performed with the SafetyNet Attestation API
    { nonce :: Maybe BS.ByteString -- ^ Nonce to pass to the SafetyNet Attestation API
    }
  | FirebaseDeviceVerificationParametersPlayIntegrity -- ^ Device verification must be performed with the classic Play Integrity verification (https://developer.android.com/google/play/integrity/classic)
    { _nonce               :: Maybe T.Text -- ^ Base64url-encoded nonce to pass to the Play Integrity API
    , cloud_project_number :: Maybe Int    -- ^ Cloud project number to pass to the Play Integrity API
    }
  deriving (Eq, Show)

instance I.ShortShow FirebaseDeviceVerificationParameters where
  shortShow FirebaseDeviceVerificationParametersSafetyNet
    { nonce = nonce_
    }
      = "FirebaseDeviceVerificationParametersSafetyNet"
        ++ I.cc
        [ "nonce" `I.p` nonce_
        ]
  shortShow FirebaseDeviceVerificationParametersPlayIntegrity
    { _nonce               = _nonce_
    , cloud_project_number = cloud_project_number_
    }
      = "FirebaseDeviceVerificationParametersPlayIntegrity"
        ++ I.cc
        [ "_nonce"               `I.p` _nonce_
        , "cloud_project_number" `I.p` cloud_project_number_
        ]

instance AT.FromJSON FirebaseDeviceVerificationParameters where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "firebaseDeviceVerificationParametersSafetyNet"     -> parseFirebaseDeviceVerificationParametersSafetyNet v
      "firebaseDeviceVerificationParametersPlayIntegrity" -> parseFirebaseDeviceVerificationParametersPlayIntegrity v
      _                                                   -> mempty
    
    where
      parseFirebaseDeviceVerificationParametersSafetyNet :: A.Value -> AT.Parser FirebaseDeviceVerificationParameters
      parseFirebaseDeviceVerificationParametersSafetyNet = A.withObject "FirebaseDeviceVerificationParametersSafetyNet" $ \o -> do
        nonce_ <- fmap I.readBytes <$> o A..:?  "nonce"
        pure $ FirebaseDeviceVerificationParametersSafetyNet
          { nonce = nonce_
          }
      parseFirebaseDeviceVerificationParametersPlayIntegrity :: A.Value -> AT.Parser FirebaseDeviceVerificationParameters
      parseFirebaseDeviceVerificationParametersPlayIntegrity = A.withObject "FirebaseDeviceVerificationParametersPlayIntegrity" $ \o -> do
        _nonce_               <- o A..:?                       "nonce"
        cloud_project_number_ <- fmap I.readInt64 <$> o A..:?  "cloud_project_number"
        pure $ FirebaseDeviceVerificationParametersPlayIntegrity
          { _nonce               = _nonce_
          , cloud_project_number = cloud_project_number_
          }
  parseJSON _ = mempty

