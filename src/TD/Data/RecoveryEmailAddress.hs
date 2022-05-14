{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.RecoveryEmailAddress where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data RecoveryEmailAddress = -- | Contains information about the current recovery email address @recovery_email_address Recovery email address
  RecoveryEmailAddress
  { -- |
    recovery_email_address :: Maybe String
  }
  deriving (Eq)

instance Show RecoveryEmailAddress where
  show
    RecoveryEmailAddress
      { recovery_email_address = recovery_email_address_
      } =
      "RecoveryEmailAddress"
        ++ U.cc
          [ U.p "recovery_email_address" recovery_email_address_
          ]

instance T.FromJSON RecoveryEmailAddress where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "recoveryEmailAddress" -> parseRecoveryEmailAddress v
      _ -> mempty
    where
      parseRecoveryEmailAddress :: A.Value -> T.Parser RecoveryEmailAddress
      parseRecoveryEmailAddress = A.withObject "RecoveryEmailAddress" $ \o -> do
        recovery_email_address_ <- o A..:? "recovery_email_address"
        return $ RecoveryEmailAddress {recovery_email_address = recovery_email_address_}
  parseJSON _ = mempty

instance T.ToJSON RecoveryEmailAddress where
  toJSON
    RecoveryEmailAddress
      { recovery_email_address = recovery_email_address_
      } =
      A.object
        [ "@type" A..= T.String "recoveryEmailAddress",
          "recovery_email_address" A..= recovery_email_address_
        ]
