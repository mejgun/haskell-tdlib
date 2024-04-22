module TD.Data.ChatRevenueWithdrawalState
  (ChatRevenueWithdrawalState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes state of a chat revenue withdrawal
data ChatRevenueWithdrawalState
  = ChatRevenueWithdrawalStatePending -- ^ Withdrawal is pending
  | ChatRevenueWithdrawalStateCompleted -- ^ Withdrawal was completed
    { date :: Maybe Int    -- ^ Point in time (Unix timestamp) when the withdrawal was completed
    , url  :: Maybe T.Text -- ^ The URL where the withdrawal transaction can be viewed
    }
  | ChatRevenueWithdrawalStateFailed -- ^ Withdrawal has_failed
  deriving (Eq, Show)

instance I.ShortShow ChatRevenueWithdrawalState where
  shortShow ChatRevenueWithdrawalStatePending
      = "ChatRevenueWithdrawalStatePending"
  shortShow ChatRevenueWithdrawalStateCompleted
    { date = date_
    , url  = url_
    }
      = "ChatRevenueWithdrawalStateCompleted"
        ++ I.cc
        [ "date" `I.p` date_
        , "url"  `I.p` url_
        ]
  shortShow ChatRevenueWithdrawalStateFailed
      = "ChatRevenueWithdrawalStateFailed"

instance AT.FromJSON ChatRevenueWithdrawalState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatRevenueWithdrawalStatePending"   -> pure ChatRevenueWithdrawalStatePending
      "chatRevenueWithdrawalStateCompleted" -> parseChatRevenueWithdrawalStateCompleted v
      "chatRevenueWithdrawalStateFailed"    -> pure ChatRevenueWithdrawalStateFailed
      _                                     -> mempty
    
    where
      parseChatRevenueWithdrawalStateCompleted :: A.Value -> AT.Parser ChatRevenueWithdrawalState
      parseChatRevenueWithdrawalStateCompleted = A.withObject "ChatRevenueWithdrawalStateCompleted" $ \o -> do
        date_ <- o A..:?  "date"
        url_  <- o A..:?  "url"
        pure $ ChatRevenueWithdrawalStateCompleted
          { date = date_
          , url  = url_
          }
  parseJSON _ = mempty

