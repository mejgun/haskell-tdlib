module TD.Data.ResetPasswordResult
  (ResetPasswordResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents result of 2-step verification password reset
data ResetPasswordResult
  = ResetPasswordResultOk -- ^ The password was reset
  | ResetPasswordResultPending -- ^ The password reset request is pending
    { pending_reset_date :: Maybe Int -- ^ Point in time (Unix timestamp) after which the password can be reset immediately using resetPassword
    }
  | ResetPasswordResultDeclined -- ^ The password reset request was declined
    { retry_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the password reset can be retried
    }
  deriving (Eq, Show)

instance I.ShortShow ResetPasswordResult where
  shortShow ResetPasswordResultOk
      = "ResetPasswordResultOk"
  shortShow ResetPasswordResultPending
    { pending_reset_date = pending_reset_date_
    }
      = "ResetPasswordResultPending"
        ++ I.cc
        [ "pending_reset_date" `I.p` pending_reset_date_
        ]
  shortShow ResetPasswordResultDeclined
    { retry_date = retry_date_
    }
      = "ResetPasswordResultDeclined"
        ++ I.cc
        [ "retry_date" `I.p` retry_date_
        ]

instance AT.FromJSON ResetPasswordResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "resetPasswordResultOk"       -> pure ResetPasswordResultOk
      "resetPasswordResultPending"  -> parseResetPasswordResultPending v
      "resetPasswordResultDeclined" -> parseResetPasswordResultDeclined v
      _                             -> mempty
    
    where
      parseResetPasswordResultPending :: A.Value -> AT.Parser ResetPasswordResult
      parseResetPasswordResultPending = A.withObject "ResetPasswordResultPending" $ \o -> do
        pending_reset_date_ <- o A..:?  "pending_reset_date"
        pure $ ResetPasswordResultPending
          { pending_reset_date = pending_reset_date_
          }
      parseResetPasswordResultDeclined :: A.Value -> AT.Parser ResetPasswordResult
      parseResetPasswordResultDeclined = A.withObject "ResetPasswordResultDeclined" $ \o -> do
        retry_date_ <- o A..:?  "retry_date"
        pure $ ResetPasswordResultDeclined
          { retry_date = retry_date_
          }
  parseJSON _ = mempty

