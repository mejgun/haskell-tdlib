module TD.Data.InputCredentials
  (InputCredentials(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Contains information about the payment method chosen by the user
data InputCredentials
  = InputCredentialsSaved -- ^ Applies if a user chooses some previously saved payment credentials. To use their previously saved credentials, the user must have a valid temporary password
    { saved_credentials_id :: Maybe T.Text -- ^ Identifier of the saved credentials
    }
  | InputCredentialsNew -- ^ Applies if a user enters new credentials on a payment provider website
    { _data      :: Maybe T.Text -- ^ JSON-encoded data with the credential identifier from the payment provider
    , allow_save :: Maybe Bool   -- ^ True, if the credential identifier can be saved on the server side
    }
  | InputCredentialsApplePay -- ^ Applies if a user enters new credentials using Apple Pay
    { _data :: Maybe T.Text -- ^ JSON-encoded data with the credential identifier
    }
  | InputCredentialsGooglePay -- ^ Applies if a user enters new credentials using Google Pay
    { _data :: Maybe T.Text -- ^ JSON-encoded data with the credential identifier
    }
  deriving (Eq, Show)

instance I.ShortShow InputCredentials where
  shortShow InputCredentialsSaved
    { saved_credentials_id = saved_credentials_id_
    }
      = "InputCredentialsSaved"
        ++ I.cc
        [ "saved_credentials_id" `I.p` saved_credentials_id_
        ]
  shortShow InputCredentialsNew
    { _data      = _data_
    , allow_save = allow_save_
    }
      = "InputCredentialsNew"
        ++ I.cc
        [ "_data"      `I.p` _data_
        , "allow_save" `I.p` allow_save_
        ]
  shortShow InputCredentialsApplePay
    { _data = _data_
    }
      = "InputCredentialsApplePay"
        ++ I.cc
        [ "_data" `I.p` _data_
        ]
  shortShow InputCredentialsGooglePay
    { _data = _data_
    }
      = "InputCredentialsGooglePay"
        ++ I.cc
        [ "_data" `I.p` _data_
        ]

instance AT.FromJSON InputCredentials where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputCredentialsSaved"     -> parseInputCredentialsSaved v
      "inputCredentialsNew"       -> parseInputCredentialsNew v
      "inputCredentialsApplePay"  -> parseInputCredentialsApplePay v
      "inputCredentialsGooglePay" -> parseInputCredentialsGooglePay v
      _                           -> mempty
    
    where
      parseInputCredentialsSaved :: A.Value -> AT.Parser InputCredentials
      parseInputCredentialsSaved = A.withObject "InputCredentialsSaved" $ \o -> do
        saved_credentials_id_ <- o A..:?  "saved_credentials_id"
        pure $ InputCredentialsSaved
          { saved_credentials_id = saved_credentials_id_
          }
      parseInputCredentialsNew :: A.Value -> AT.Parser InputCredentials
      parseInputCredentialsNew = A.withObject "InputCredentialsNew" $ \o -> do
        _data_      <- o A..:?  "data"
        allow_save_ <- o A..:?  "allow_save"
        pure $ InputCredentialsNew
          { _data      = _data_
          , allow_save = allow_save_
          }
      parseInputCredentialsApplePay :: A.Value -> AT.Parser InputCredentials
      parseInputCredentialsApplePay = A.withObject "InputCredentialsApplePay" $ \o -> do
        _data_ <- o A..:?  "data"
        pure $ InputCredentialsApplePay
          { _data = _data_
          }
      parseInputCredentialsGooglePay :: A.Value -> AT.Parser InputCredentials
      parseInputCredentialsGooglePay = A.withObject "InputCredentialsGooglePay" $ \o -> do
        _data_ <- o A..:?  "data"
        pure $ InputCredentialsGooglePay
          { _data = _data_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputCredentials where
  toJSON InputCredentialsSaved
    { saved_credentials_id = saved_credentials_id_
    }
      = A.object
        [ "@type"                A..= AT.String "inputCredentialsSaved"
        , "saved_credentials_id" A..= saved_credentials_id_
        ]
  toJSON InputCredentialsNew
    { _data      = _data_
    , allow_save = allow_save_
    }
      = A.object
        [ "@type"      A..= AT.String "inputCredentialsNew"
        , "data"       A..= _data_
        , "allow_save" A..= allow_save_
        ]
  toJSON InputCredentialsApplePay
    { _data = _data_
    }
      = A.object
        [ "@type" A..= AT.String "inputCredentialsApplePay"
        , "data"  A..= _data_
        ]
  toJSON InputCredentialsGooglePay
    { _data = _data_
    }
      = A.object
        [ "@type" A..= AT.String "inputCredentialsGooglePay"
        , "data"  A..= _data_
        ]

