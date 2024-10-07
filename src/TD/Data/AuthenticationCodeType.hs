module TD.Data.AuthenticationCodeType
  (AuthenticationCodeType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.FirebaseDeviceVerificationParameters as FirebaseDeviceVerificationParameters

-- | Provides information about the method by which an authentication code is delivered to the user
data AuthenticationCodeType
  = AuthenticationCodeTypeTelegramMessage -- ^ A digit-only authentication code is delivered via a private Telegram message, which can be viewed from another active session
    { _length :: Maybe Int -- ^ Length of the code
    }
  | AuthenticationCodeTypeSms -- ^ A digit-only authentication code is delivered via an SMS message to the specified phone number; non-official applications may not receive this type of code
    { _length :: Maybe Int -- ^ Length of the code
    }
  | AuthenticationCodeTypeSmsWord -- ^ An authentication code is a word delivered via an SMS message to the specified phone number; non-official applications may not receive this type of code
    { first_letter :: Maybe T.Text -- ^ The first letters of the word if known
    }
  | AuthenticationCodeTypeSmsPhrase -- ^ An authentication code is a phrase from multiple words delivered via an SMS message to the specified phone number; non-official applications may not receive this type of code
    { first_word :: Maybe T.Text -- ^ The first word of the phrase if known
    }
  | AuthenticationCodeTypeCall -- ^ A digit-only authentication code is delivered via a phone call to the specified phone number
    { _length :: Maybe Int -- ^ Length of the code
    }
  | AuthenticationCodeTypeFlashCall -- ^ An authentication code is delivered by an immediately canceled call to the specified phone number. The phone number that calls is the code that must be entered automatically
    { pattern :: Maybe T.Text -- ^ Pattern of the phone number from which the call will be made
    }
  | AuthenticationCodeTypeMissedCall -- ^ An authentication code is delivered by an immediately canceled call to the specified phone number. The last digits of the phone number that calls are the code that must be entered manually by the user
    { phone_number_prefix :: Maybe T.Text -- ^ Prefix of the phone number from which the call will be made
    , _length             :: Maybe Int    -- ^ Number of digits in the code, excluding the prefix
    }
  | AuthenticationCodeTypeFragment -- ^ A digit-only authentication code is delivered to https://fragment.com. The user must be logged in there via a wallet owning the phone number's NFT
    { url     :: Maybe T.Text -- ^ URL to open to receive the code
    , _length :: Maybe Int    -- ^ Length of the code
    }
  | AuthenticationCodeTypeFirebaseAndroid -- ^ A digit-only authentication code is delivered via Firebase Authentication to the official Android application
    { device_verification_parameters :: Maybe FirebaseDeviceVerificationParameters.FirebaseDeviceVerificationParameters -- ^ Parameters to be used for device verification
    , _length                        :: Maybe Int                                                                       -- ^ Length of the code
    }
  | AuthenticationCodeTypeFirebaseIos -- ^ A digit-only authentication code is delivered via Firebase Authentication to the official iOS application
    { receipt      :: Maybe T.Text -- ^ Receipt of successful application token validation to compare with receipt from push notification
    , push_timeout :: Maybe Int    -- ^ Time after the next authentication method is expected to be used if verification push notification isn't received, in seconds
    , _length      :: Maybe Int    -- ^ Length of the code
    }
  deriving (Eq, Show)

instance I.ShortShow AuthenticationCodeType where
  shortShow AuthenticationCodeTypeTelegramMessage
    { _length = _length_
    }
      = "AuthenticationCodeTypeTelegramMessage"
        ++ I.cc
        [ "_length" `I.p` _length_
        ]
  shortShow AuthenticationCodeTypeSms
    { _length = _length_
    }
      = "AuthenticationCodeTypeSms"
        ++ I.cc
        [ "_length" `I.p` _length_
        ]
  shortShow AuthenticationCodeTypeSmsWord
    { first_letter = first_letter_
    }
      = "AuthenticationCodeTypeSmsWord"
        ++ I.cc
        [ "first_letter" `I.p` first_letter_
        ]
  shortShow AuthenticationCodeTypeSmsPhrase
    { first_word = first_word_
    }
      = "AuthenticationCodeTypeSmsPhrase"
        ++ I.cc
        [ "first_word" `I.p` first_word_
        ]
  shortShow AuthenticationCodeTypeCall
    { _length = _length_
    }
      = "AuthenticationCodeTypeCall"
        ++ I.cc
        [ "_length" `I.p` _length_
        ]
  shortShow AuthenticationCodeTypeFlashCall
    { pattern = pattern_
    }
      = "AuthenticationCodeTypeFlashCall"
        ++ I.cc
        [ "pattern" `I.p` pattern_
        ]
  shortShow AuthenticationCodeTypeMissedCall
    { phone_number_prefix = phone_number_prefix_
    , _length             = _length_
    }
      = "AuthenticationCodeTypeMissedCall"
        ++ I.cc
        [ "phone_number_prefix" `I.p` phone_number_prefix_
        , "_length"             `I.p` _length_
        ]
  shortShow AuthenticationCodeTypeFragment
    { url     = url_
    , _length = _length_
    }
      = "AuthenticationCodeTypeFragment"
        ++ I.cc
        [ "url"     `I.p` url_
        , "_length" `I.p` _length_
        ]
  shortShow AuthenticationCodeTypeFirebaseAndroid
    { device_verification_parameters = device_verification_parameters_
    , _length                        = _length_
    }
      = "AuthenticationCodeTypeFirebaseAndroid"
        ++ I.cc
        [ "device_verification_parameters" `I.p` device_verification_parameters_
        , "_length"                        `I.p` _length_
        ]
  shortShow AuthenticationCodeTypeFirebaseIos
    { receipt      = receipt_
    , push_timeout = push_timeout_
    , _length      = _length_
    }
      = "AuthenticationCodeTypeFirebaseIos"
        ++ I.cc
        [ "receipt"      `I.p` receipt_
        , "push_timeout" `I.p` push_timeout_
        , "_length"      `I.p` _length_
        ]

instance AT.FromJSON AuthenticationCodeType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "authenticationCodeTypeTelegramMessage" -> parseAuthenticationCodeTypeTelegramMessage v
      "authenticationCodeTypeSms"             -> parseAuthenticationCodeTypeSms v
      "authenticationCodeTypeSmsWord"         -> parseAuthenticationCodeTypeSmsWord v
      "authenticationCodeTypeSmsPhrase"       -> parseAuthenticationCodeTypeSmsPhrase v
      "authenticationCodeTypeCall"            -> parseAuthenticationCodeTypeCall v
      "authenticationCodeTypeFlashCall"       -> parseAuthenticationCodeTypeFlashCall v
      "authenticationCodeTypeMissedCall"      -> parseAuthenticationCodeTypeMissedCall v
      "authenticationCodeTypeFragment"        -> parseAuthenticationCodeTypeFragment v
      "authenticationCodeTypeFirebaseAndroid" -> parseAuthenticationCodeTypeFirebaseAndroid v
      "authenticationCodeTypeFirebaseIos"     -> parseAuthenticationCodeTypeFirebaseIos v
      _                                       -> mempty
    
    where
      parseAuthenticationCodeTypeTelegramMessage :: A.Value -> AT.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeTelegramMessage = A.withObject "AuthenticationCodeTypeTelegramMessage" $ \o -> do
        _length_ <- o A..:?  "length"
        pure $ AuthenticationCodeTypeTelegramMessage
          { _length = _length_
          }
      parseAuthenticationCodeTypeSms :: A.Value -> AT.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeSms = A.withObject "AuthenticationCodeTypeSms" $ \o -> do
        _length_ <- o A..:?  "length"
        pure $ AuthenticationCodeTypeSms
          { _length = _length_
          }
      parseAuthenticationCodeTypeSmsWord :: A.Value -> AT.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeSmsWord = A.withObject "AuthenticationCodeTypeSmsWord" $ \o -> do
        first_letter_ <- o A..:?  "first_letter"
        pure $ AuthenticationCodeTypeSmsWord
          { first_letter = first_letter_
          }
      parseAuthenticationCodeTypeSmsPhrase :: A.Value -> AT.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeSmsPhrase = A.withObject "AuthenticationCodeTypeSmsPhrase" $ \o -> do
        first_word_ <- o A..:?  "first_word"
        pure $ AuthenticationCodeTypeSmsPhrase
          { first_word = first_word_
          }
      parseAuthenticationCodeTypeCall :: A.Value -> AT.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeCall = A.withObject "AuthenticationCodeTypeCall" $ \o -> do
        _length_ <- o A..:?  "length"
        pure $ AuthenticationCodeTypeCall
          { _length = _length_
          }
      parseAuthenticationCodeTypeFlashCall :: A.Value -> AT.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeFlashCall = A.withObject "AuthenticationCodeTypeFlashCall" $ \o -> do
        pattern_ <- o A..:?  "pattern"
        pure $ AuthenticationCodeTypeFlashCall
          { pattern = pattern_
          }
      parseAuthenticationCodeTypeMissedCall :: A.Value -> AT.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeMissedCall = A.withObject "AuthenticationCodeTypeMissedCall" $ \o -> do
        phone_number_prefix_ <- o A..:?  "phone_number_prefix"
        _length_             <- o A..:?  "length"
        pure $ AuthenticationCodeTypeMissedCall
          { phone_number_prefix = phone_number_prefix_
          , _length             = _length_
          }
      parseAuthenticationCodeTypeFragment :: A.Value -> AT.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeFragment = A.withObject "AuthenticationCodeTypeFragment" $ \o -> do
        url_     <- o A..:?  "url"
        _length_ <- o A..:?  "length"
        pure $ AuthenticationCodeTypeFragment
          { url     = url_
          , _length = _length_
          }
      parseAuthenticationCodeTypeFirebaseAndroid :: A.Value -> AT.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeFirebaseAndroid = A.withObject "AuthenticationCodeTypeFirebaseAndroid" $ \o -> do
        device_verification_parameters_ <- o A..:?  "device_verification_parameters"
        _length_                        <- o A..:?  "length"
        pure $ AuthenticationCodeTypeFirebaseAndroid
          { device_verification_parameters = device_verification_parameters_
          , _length                        = _length_
          }
      parseAuthenticationCodeTypeFirebaseIos :: A.Value -> AT.Parser AuthenticationCodeType
      parseAuthenticationCodeTypeFirebaseIos = A.withObject "AuthenticationCodeTypeFirebaseIos" $ \o -> do
        receipt_      <- o A..:?  "receipt"
        push_timeout_ <- o A..:?  "push_timeout"
        _length_      <- o A..:?  "length"
        pure $ AuthenticationCodeTypeFirebaseIos
          { receipt      = receipt_
          , push_timeout = push_timeout_
          , _length      = _length_
          }
  parseJSON _ = mempty

