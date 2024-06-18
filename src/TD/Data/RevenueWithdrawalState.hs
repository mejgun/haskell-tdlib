module TD.Data.RevenueWithdrawalState
  (RevenueWithdrawalState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes state of a revenue withdrawal
data RevenueWithdrawalState
  = RevenueWithdrawalStatePending -- ^ Withdrawal is pending
  | RevenueWithdrawalStateSucceeded -- ^ Withdrawal succeeded
    { date :: Maybe Int    -- ^ Point in time (Unix timestamp) when the withdrawal was completed
    , url  :: Maybe T.Text -- ^ The URL where the withdrawal transaction can be viewed
    }
  | RevenueWithdrawalStateFailed -- ^ Withdrawal failed
  deriving (Eq, Show)

instance I.ShortShow RevenueWithdrawalState where
  shortShow RevenueWithdrawalStatePending
      = "RevenueWithdrawalStatePending"
  shortShow RevenueWithdrawalStateSucceeded
    { date = date_
    , url  = url_
    }
      = "RevenueWithdrawalStateSucceeded"
        ++ I.cc
        [ "date" `I.p` date_
        , "url"  `I.p` url_
        ]
  shortShow RevenueWithdrawalStateFailed
      = "RevenueWithdrawalStateFailed"

instance AT.FromJSON RevenueWithdrawalState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "revenueWithdrawalStatePending"   -> pure RevenueWithdrawalStatePending
      "revenueWithdrawalStateSucceeded" -> parseRevenueWithdrawalStateSucceeded v
      "revenueWithdrawalStateFailed"    -> pure RevenueWithdrawalStateFailed
      _                                 -> mempty
    
    where
      parseRevenueWithdrawalStateSucceeded :: A.Value -> AT.Parser RevenueWithdrawalState
      parseRevenueWithdrawalStateSucceeded = A.withObject "RevenueWithdrawalStateSucceeded" $ \o -> do
        date_ <- o A..:?  "date"
        url_  <- o A..:?  "url"
        pure $ RevenueWithdrawalStateSucceeded
          { date = date_
          , url  = url_
          }
  parseJSON _ = mempty

