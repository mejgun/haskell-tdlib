{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AuthenticationCodeType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Provides information about the method by which an authentication code is delivered to the user
data AuthenticationCodeType
  = -- | An authentication code is delivered via a private Telegram message, which can be viewed from another active session
    AuthenticationCodeTypeTelegramMessage
      { -- | Length of the code
        _length :: Maybe Int
      }
  | -- | An authentication code is delivered via an SMS message to the specified phone number; applications may not receive this type of code
    AuthenticationCodeTypeSms
      { -- | Length of the code
        _length :: Maybe Int
      }
  | -- | An authentication code is delivered via a phone call to the specified phone number
    AuthenticationCodeTypeCall
      { -- | Length of the code
        _length :: Maybe Int
      }
  | -- | An authentication code is delivered by an immediately canceled call to the specified phone number. The phone number that calls is the code that must be entered automatically
    AuthenticationCodeTypeFlashCall
      { -- | Pattern of the phone number from which the call will be made
        pattern :: Maybe String
      }
  | -- | An authentication code is delivered by an immediately canceled call to the specified phone number. The last digits of the phone number that calls are the code that must be entered manually by the user
    AuthenticationCodeTypeMissedCall
      { -- | Number of digits in the code, excluding the prefix
        _length :: Maybe Int,
        -- | Prefix of the phone number from which the call will be made
        phone_number_prefix :: Maybe String
      }
  | -- | An authentication code is delivered to https://fragment.com. The user must be logged in there via a wallet owning the phone number's NFT
    AuthenticationCodeTypeFragment
      { -- | Length of the code
        _length :: Maybe Int,
        -- | URL to open to receive the code
        url :: Maybe String
      }
  | -- | An authentication code is delivered via Firebase Authentication to the official Android application
    AuthenticationCodeTypeFirebaseAndroid
      { -- | Length of the code
        _length :: Maybe Int,
        -- | Nonce to pass to the SafetyNet Attestation API
        nonce :: Maybe String
      }
  | -- | An authentication code is delivered via Firebase Authentication to the official iOS application
    AuthenticationCodeTypeFirebaseIos
      { -- | Length of the code
        _length :: Maybe Int,
        -- | Time after the next authentication method is supposed to be used if verification push notification isn't received, in seconds
        push_timeout :: Maybe Int,
        -- | Receipt of successful application token validation to compare with receipt from push notification
        receipt :: Maybe String
      }
  deriving (Eq)

instance Show AuthenticationCodeType where
  show
    AuthenticationCodeTypeTelegramMessage
      { _length = _length_
      } =
      "AuthenticationCodeTypeTelegramMessage"
        ++ U.cc
          [ U.p "_length" _length_
          ]
  show
    AuthenticationCodeTypeSms
      { _length = _length_
      } =
      "AuthenticationCodeTypeSms"
        ++ U.cc
          [ U.p "_length" _length_
          ]
  show
    AuthenticationCodeTypeCall
      { _length = _length_
      } =
      "AuthenticationCodeTypeCall"
        ++ U.cc
          [ U.p "_length" _length_
          ]
  show
    AuthenticationCodeTypeFlashCall
      { pattern = pattern_
      } =
      "AuthenticationCodeTypeFlashCall"
        ++ U.cc
          [ U.p "pattern" pattern_
          ]
  show
    AuthenticationCodeTypeMissedCall
      { _length = _length_,
        phone_number_prefix = phone_number_prefix_
      } =
      "AuthenticationCodeTypeMissedCall"
        ++ U.cc
          [ U.p "_length" _length_,
            U.p "phone_number_prefix" phone_number_prefix_
          ]
  show
    AuthenticationCodeTypeFragment
      { _length = _length_,
        url = url_
      } =
      "AuthenticationCodeTypeFragment"
        ++ U.cc
          [ U.p "_length" _length_,
            U.p "url" url_
          ]
  show
    AuthenticationCodeTypeFirebaseAndroid
      { _length = _length_,
        nonce = nonce_
      } =
      "AuthenticationCodeTypeFirebaseAndroid"
        ++ U.cc
          [ U.p "_length" _length_,
            U.p "nonce" nonce_
          ]
  show
    AuthenticationCodeTypeFirebaseIos
      { _length = _length_,
        push_timeout = push_timeout_,
        receipt = receipt_
      } =
      "AuthenticationCodeTypeFirebaseIos"
        ++ U.cc
          [ U.p "_length" _length_,
            U.p "push_timeout" push_timeout_,
            U.p "receipt" receipt_
          ]

instance T.FromJSON AuthenticationCodeType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "authenticationCodeTypeTelegramMessage" -> parseAuthenticationCodeTypeTelegramMessage v
      "authenticationCodeTypeSms" -> parseAuthenticationCodeTypeSms v
      "authenticationCodeTypeCall" -> parseAuthenticationCodeTypeCall v
      "authenticationCodeTypeFlashCall" -> parseAuthenticationCodeTypeFlashCall v
      "authenticationCodeTypeMissedCall" -> parseAuthenticationCodeTypeMissedCall v
      "authenticationCodeTypeFragment" -> parseAuthenticationCodeTypeFragment v
      "authenticationCodeTypeFirebaseAndroid" -> parseAuthenticationCodeTypeFirebaseAndroid v
      "authenticationCodeTypeFirebaseIos" -> parseAuthenticationCodeTypeFirebaseIos v
      _ -> mempty
    where
      parseAuthenticationCodeTypeTelegramMessage :: A.Value -> T.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeTelegramMessage = A.withObject "AuthenticationCodeTypeTelegramMessage" $ \o -> do
        _length_ <- o A..:? "length"
        return $ AuthenticationCodeTypeTelegramMessage {_length = _length_}

      parseAuthenticationCodeTypeSms :: A.Value -> T.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeSms = A.withObject "AuthenticationCodeTypeSms" $ \o -> do
        _length_ <- o A..:? "length"
        return $ AuthenticationCodeTypeSms {_length = _length_}

      parseAuthenticationCodeTypeCall :: A.Value -> T.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeCall = A.withObject "AuthenticationCodeTypeCall" $ \o -> do
        _length_ <- o A..:? "length"
        return $ AuthenticationCodeTypeCall {_length = _length_}

      parseAuthenticationCodeTypeFlashCall :: A.Value -> T.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeFlashCall = A.withObject "AuthenticationCodeTypeFlashCall" $ \o -> do
        pattern_ <- o A..:? "pattern"
        return $ AuthenticationCodeTypeFlashCall {pattern = pattern_}

      parseAuthenticationCodeTypeMissedCall :: A.Value -> T.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeMissedCall = A.withObject "AuthenticationCodeTypeMissedCall" $ \o -> do
        _length_ <- o A..:? "length"
        phone_number_prefix_ <- o A..:? "phone_number_prefix"
        return $ AuthenticationCodeTypeMissedCall {_length = _length_, phone_number_prefix = phone_number_prefix_}

      parseAuthenticationCodeTypeFragment :: A.Value -> T.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeFragment = A.withObject "AuthenticationCodeTypeFragment" $ \o -> do
        _length_ <- o A..:? "length"
        url_ <- o A..:? "url"
        return $ AuthenticationCodeTypeFragment {_length = _length_, url = url_}

      parseAuthenticationCodeTypeFirebaseAndroid :: A.Value -> T.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeFirebaseAndroid = A.withObject "AuthenticationCodeTypeFirebaseAndroid" $ \o -> do
        _length_ <- o A..:? "length"
        nonce_ <- o A..:? "nonce"
        return $ AuthenticationCodeTypeFirebaseAndroid {_length = _length_, nonce = nonce_}

      parseAuthenticationCodeTypeFirebaseIos :: A.Value -> T.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeFirebaseIos = A.withObject "AuthenticationCodeTypeFirebaseIos" $ \o -> do
        _length_ <- o A..:? "length"
        push_timeout_ <- o A..:? "push_timeout"
        receipt_ <- o A..:? "receipt"
        return $ AuthenticationCodeTypeFirebaseIos {_length = _length_, push_timeout = push_timeout_, receipt = receipt_}
  parseJSON _ = mempty

instance T.ToJSON AuthenticationCodeType where
  toJSON
    AuthenticationCodeTypeTelegramMessage
      { _length = _length_
      } =
      A.object
        [ "@type" A..= T.String "authenticationCodeTypeTelegramMessage",
          "length" A..= _length_
        ]
  toJSON
    AuthenticationCodeTypeSms
      { _length = _length_
      } =
      A.object
        [ "@type" A..= T.String "authenticationCodeTypeSms",
          "length" A..= _length_
        ]
  toJSON
    AuthenticationCodeTypeCall
      { _length = _length_
      } =
      A.object
        [ "@type" A..= T.String "authenticationCodeTypeCall",
          "length" A..= _length_
        ]
  toJSON
    AuthenticationCodeTypeFlashCall
      { pattern = pattern_
      } =
      A.object
        [ "@type" A..= T.String "authenticationCodeTypeFlashCall",
          "pattern" A..= pattern_
        ]
  toJSON
    AuthenticationCodeTypeMissedCall
      { _length = _length_,
        phone_number_prefix = phone_number_prefix_
      } =
      A.object
        [ "@type" A..= T.String "authenticationCodeTypeMissedCall",
          "length" A..= _length_,
          "phone_number_prefix" A..= phone_number_prefix_
        ]
  toJSON
    AuthenticationCodeTypeFragment
      { _length = _length_,
        url = url_
      } =
      A.object
        [ "@type" A..= T.String "authenticationCodeTypeFragment",
          "length" A..= _length_,
          "url" A..= url_
        ]
  toJSON
    AuthenticationCodeTypeFirebaseAndroid
      { _length = _length_,
        nonce = nonce_
      } =
      A.object
        [ "@type" A..= T.String "authenticationCodeTypeFirebaseAndroid",
          "length" A..= _length_,
          "nonce" A..= nonce_
        ]
  toJSON
    AuthenticationCodeTypeFirebaseIos
      { _length = _length_,
        push_timeout = push_timeout_,
        receipt = receipt_
      } =
      A.object
        [ "@type" A..= T.String "authenticationCodeTypeFirebaseIos",
          "length" A..= _length_,
          "push_timeout" A..= push_timeout_,
          "receipt" A..= receipt_
        ]
