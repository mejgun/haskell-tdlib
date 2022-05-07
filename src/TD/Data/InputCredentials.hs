{-# LANGUAGE OverloadedStrings #-}

module TD.Data.InputCredentials where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains information about the payment method chosen by the user
data InputCredentials
  = -- | Applies if a user chooses some previously saved payment credentials. To use their previously saved credentials, the user must have a valid temporary password @saved_credentials_id Identifier of the saved credentials
    InputCredentialsSaved
      { -- |
        saved_credentials_id :: Maybe String
      }
  | -- | Applies if a user enters new credentials on a payment provider website @data JSON-encoded data with the credential identifier from the payment provider @allow_save True, if the credential identifier can be saved on the server side
    InputCredentialsNew
      { -- |
        allow_save :: Maybe Bool,
        -- |
        _data :: Maybe String
      }
  | -- | Applies if a user enters new credentials using Apple Pay @data JSON-encoded data with the credential identifier
    InputCredentialsApplePay
      { -- |
        _data :: Maybe String
      }
  | -- | Applies if a user enters new credentials using Google Pay @data JSON-encoded data with the credential identifier
    InputCredentialsGooglePay
      { -- |
        _data :: Maybe String
      }
  deriving (Eq)

instance Show InputCredentials where
  show
    InputCredentialsSaved
      { saved_credentials_id = saved_credentials_id
      } =
      "InputCredentialsSaved"
        ++ U.cc
          [ U.p "saved_credentials_id" saved_credentials_id
          ]
  show
    InputCredentialsNew
      { allow_save = allow_save,
        _data = _data
      } =
      "InputCredentialsNew"
        ++ U.cc
          [ U.p "allow_save" allow_save,
            U.p "_data" _data
          ]
  show
    InputCredentialsApplePay
      { _data = _data
      } =
      "InputCredentialsApplePay"
        ++ U.cc
          [ U.p "_data" _data
          ]
  show
    InputCredentialsGooglePay
      { _data = _data
      } =
      "InputCredentialsGooglePay"
        ++ U.cc
          [ U.p "_data" _data
          ]

instance T.FromJSON InputCredentials where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputCredentialsSaved" -> parseInputCredentialsSaved v
      "inputCredentialsNew" -> parseInputCredentialsNew v
      "inputCredentialsApplePay" -> parseInputCredentialsApplePay v
      "inputCredentialsGooglePay" -> parseInputCredentialsGooglePay v
      _ -> mempty
    where
      parseInputCredentialsSaved :: A.Value -> T.Parser InputCredentials
      parseInputCredentialsSaved = A.withObject "InputCredentialsSaved" $ \o -> do
        saved_credentials_id_ <- o A..:? "saved_credentials_id"
        return $ InputCredentialsSaved {saved_credentials_id = saved_credentials_id_}

      parseInputCredentialsNew :: A.Value -> T.Parser InputCredentials
      parseInputCredentialsNew = A.withObject "InputCredentialsNew" $ \o -> do
        allow_save_ <- o A..:? "allow_save"
        _data_ <- o A..:? "data"
        return $ InputCredentialsNew {allow_save = allow_save_, _data = _data_}

      parseInputCredentialsApplePay :: A.Value -> T.Parser InputCredentials
      parseInputCredentialsApplePay = A.withObject "InputCredentialsApplePay" $ \o -> do
        _data_ <- o A..:? "data"
        return $ InputCredentialsApplePay {_data = _data_}

      parseInputCredentialsGooglePay :: A.Value -> T.Parser InputCredentials
      parseInputCredentialsGooglePay = A.withObject "InputCredentialsGooglePay" $ \o -> do
        _data_ <- o A..:? "data"
        return $ InputCredentialsGooglePay {_data = _data_}
  parseJSON _ = mempty

instance T.ToJSON InputCredentials where
  toJSON
    InputCredentialsSaved
      { saved_credentials_id = saved_credentials_id
      } =
      A.object
        [ "@type" A..= T.String "inputCredentialsSaved",
          "saved_credentials_id" A..= saved_credentials_id
        ]
  toJSON
    InputCredentialsNew
      { allow_save = allow_save,
        _data = _data
      } =
      A.object
        [ "@type" A..= T.String "inputCredentialsNew",
          "allow_save" A..= allow_save,
          "data" A..= _data
        ]
  toJSON
    InputCredentialsApplePay
      { _data = _data
      } =
      A.object
        [ "@type" A..= T.String "inputCredentialsApplePay",
          "data" A..= _data
        ]
  toJSON
    InputCredentialsGooglePay
      { _data = _data
      } =
      A.object
        [ "@type" A..= T.String "inputCredentialsGooglePay",
          "data" A..= _data
        ]
