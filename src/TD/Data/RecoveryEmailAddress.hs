module TD.Data.RecoveryEmailAddress
  (RecoveryEmailAddress(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data RecoveryEmailAddress
  = RecoveryEmailAddress -- ^ Contains information about the current recovery email address
    { recovery_email_address :: Maybe T.Text -- ^ Recovery email address
    }
  deriving (Eq, Show)

instance I.ShortShow RecoveryEmailAddress where
  shortShow RecoveryEmailAddress
    { recovery_email_address = recovery_email_address_
    }
      = "RecoveryEmailAddress"
        ++ I.cc
        [ "recovery_email_address" `I.p` recovery_email_address_
        ]

instance AT.FromJSON RecoveryEmailAddress where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "recoveryEmailAddress" -> parseRecoveryEmailAddress v
      _                      -> mempty
    
    where
      parseRecoveryEmailAddress :: A.Value -> AT.Parser RecoveryEmailAddress
      parseRecoveryEmailAddress = A.withObject "RecoveryEmailAddress" $ \o -> do
        recovery_email_address_ <- o A..:?  "recovery_email_address"
        pure $ RecoveryEmailAddress
          { recovery_email_address = recovery_email_address_
          }
  parseJSON _ = mempty

