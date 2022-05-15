{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AuthenticationCodeType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Provides information about the method by which an authentication code is delivered to the user
data AuthenticationCodeType
  = -- | An authentication code is delivered via a private Telegram message, which can be viewed from another active session @length Length of the code
    AuthenticationCodeTypeTelegramMessage
      { -- |
        _length :: Maybe Int
      }
  | -- | An authentication code is delivered via an SMS message to the specified phone number @length Length of the code
    AuthenticationCodeTypeSms
      { -- |
        _length :: Maybe Int
      }
  | -- | An authentication code is delivered via a phone call to the specified phone number @length Length of the code
    AuthenticationCodeTypeCall
      { -- |
        _length :: Maybe Int
      }
  | -- | An authentication code is delivered by an immediately canceled call to the specified phone number. The phone number that calls is the code that must be entered automatically @pattern Pattern of the phone number from which the call will be made
    AuthenticationCodeTypeFlashCall
      { -- |
        pattern :: Maybe String
      }
  | -- | An authentication code is delivered by an immediately canceled call to the specified phone number. The last digits of the phone number that calls are the code that must be entered manually by the user @phone_number_prefix Prefix of the phone number from which the call will be made @length Number of digits in the code, excluding the prefix
    AuthenticationCodeTypeMissedCall
      { -- |
        _length :: Maybe Int,
        -- |
        phone_number_prefix :: Maybe String
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

instance T.FromJSON AuthenticationCodeType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "authenticationCodeTypeTelegramMessage" -> parseAuthenticationCodeTypeTelegramMessage v
      "authenticationCodeTypeSms" -> parseAuthenticationCodeTypeSms v
      "authenticationCodeTypeCall" -> parseAuthenticationCodeTypeCall v
      "authenticationCodeTypeFlashCall" -> parseAuthenticationCodeTypeFlashCall v
      "authenticationCodeTypeMissedCall" -> parseAuthenticationCodeTypeMissedCall v
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
