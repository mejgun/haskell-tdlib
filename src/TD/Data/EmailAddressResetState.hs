{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.EmailAddressResetState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes reset state of a email address
data EmailAddressResetState
  = -- | Email address can be reset after the given period. Call resetAuthenticationEmailAddress to reset it and allow the user to authorize with a code sent to the user's phone number
    EmailAddressResetStateAvailable
      { -- | Time required to wait before the email address can be reset; 0 if the user is subscribed to Telegram Premium
        wait_period :: Maybe Int
      }
  | -- | Email address reset has already been requested. Call resetAuthenticationEmailAddress to check whether immediate reset is possible
    EmailAddressResetStatePending
      { -- | Left time before the email address will be reset, in seconds. updateAuthorizationState is not sent when this field changes
        reset_in :: Maybe Int
      }
  deriving (Eq)

instance Show EmailAddressResetState where
  show
    EmailAddressResetStateAvailable
      { wait_period = wait_period_
      } =
      "EmailAddressResetStateAvailable"
        ++ U.cc
          [ U.p "wait_period" wait_period_
          ]
  show
    EmailAddressResetStatePending
      { reset_in = reset_in_
      } =
      "EmailAddressResetStatePending"
        ++ U.cc
          [ U.p "reset_in" reset_in_
          ]

instance T.FromJSON EmailAddressResetState where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "emailAddressResetStateAvailable" -> parseEmailAddressResetStateAvailable v
      "emailAddressResetStatePending" -> parseEmailAddressResetStatePending v
      _ -> mempty
    where
      parseEmailAddressResetStateAvailable :: A.Value -> T.Parser EmailAddressResetState
      parseEmailAddressResetStateAvailable = A.withObject "EmailAddressResetStateAvailable" $ \o -> do
        wait_period_ <- o A..:? "wait_period"
        return $ EmailAddressResetStateAvailable {wait_period = wait_period_}

      parseEmailAddressResetStatePending :: A.Value -> T.Parser EmailAddressResetState
      parseEmailAddressResetStatePending = A.withObject "EmailAddressResetStatePending" $ \o -> do
        reset_in_ <- o A..:? "reset_in"
        return $ EmailAddressResetStatePending {reset_in = reset_in_}
  parseJSON _ = mempty

instance T.ToJSON EmailAddressResetState where
  toJSON
    EmailAddressResetStateAvailable
      { wait_period = wait_period_
      } =
      A.object
        [ "@type" A..= T.String "emailAddressResetStateAvailable",
          "wait_period" A..= wait_period_
        ]
  toJSON
    EmailAddressResetStatePending
      { reset_in = reset_in_
      } =
      A.object
        [ "@type" A..= T.String "emailAddressResetStatePending",
          "reset_in" A..= reset_in_
        ]
