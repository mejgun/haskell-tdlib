module TD.Data.EmailAddressResetState
  (EmailAddressResetState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes reset state of an email address
data EmailAddressResetState
  = EmailAddressResetStateAvailable -- ^ Email address can be reset after the given period. Call resetAuthenticationEmailAddress to reset it and allow the user to authorize with a code sent to the user's phone number
    { wait_period :: Maybe Int -- ^ Time required to wait before the email address can be reset; 0 if the user is subscribed to Telegram Premium
    }
  | EmailAddressResetStatePending -- ^ Email address reset has already been requested. Call resetAuthenticationEmailAddress to check whether immediate reset is possible
    { reset_in :: Maybe Int -- ^ Left time before the email address will be reset, in seconds. updateAuthorizationState is not sent when this field changes
    }
  deriving (Eq, Show)

instance I.ShortShow EmailAddressResetState where
  shortShow EmailAddressResetStateAvailable
    { wait_period = wait_period_
    }
      = "EmailAddressResetStateAvailable"
        ++ I.cc
        [ "wait_period" `I.p` wait_period_
        ]
  shortShow EmailAddressResetStatePending
    { reset_in = reset_in_
    }
      = "EmailAddressResetStatePending"
        ++ I.cc
        [ "reset_in" `I.p` reset_in_
        ]

instance AT.FromJSON EmailAddressResetState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "emailAddressResetStateAvailable" -> parseEmailAddressResetStateAvailable v
      "emailAddressResetStatePending"   -> parseEmailAddressResetStatePending v
      _                                 -> mempty
    
    where
      parseEmailAddressResetStateAvailable :: A.Value -> AT.Parser EmailAddressResetState
      parseEmailAddressResetStateAvailable = A.withObject "EmailAddressResetStateAvailable" $ \o -> do
        wait_period_ <- o A..:?  "wait_period"
        pure $ EmailAddressResetStateAvailable
          { wait_period = wait_period_
          }
      parseEmailAddressResetStatePending :: A.Value -> AT.Parser EmailAddressResetState
      parseEmailAddressResetStatePending = A.withObject "EmailAddressResetStatePending" $ \o -> do
        reset_in_ <- o A..:?  "reset_in"
        pure $ EmailAddressResetStatePending
          { reset_in = reset_in_
          }
  parseJSON _ = mempty

