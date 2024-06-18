module TD.Data.ChatRevenueTransactionType
  (ChatRevenueTransactionType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.RevenueWithdrawalState as RevenueWithdrawalState

-- | Describes type of transaction for revenue earned from sponsored messages in a chat
data ChatRevenueTransactionType
  = ChatRevenueTransactionTypeEarnings -- ^ Describes earnings from sponsored messages in a chat in some time frame
    { start_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the earnings started
    , end_date   :: Maybe Int -- ^ Point in time (Unix timestamp) when the earnings ended
    }
  | ChatRevenueTransactionTypeWithdrawal -- ^ Describes a withdrawal of earnings
    { withdrawal_date :: Maybe Int                                           -- ^ Point in time (Unix timestamp) when the earnings withdrawal started
    , provider        :: Maybe T.Text                                        -- ^ Name of the payment provider
    , state           :: Maybe RevenueWithdrawalState.RevenueWithdrawalState -- ^ State of the withdrawal
    }
  | ChatRevenueTransactionTypeRefund -- ^ Describes a refund for failed withdrawal of earnings
    { refund_date :: Maybe Int    -- ^ Point in time (Unix timestamp) when the transaction was refunded
    , provider    :: Maybe T.Text -- ^ Name of the payment provider
    }
  deriving (Eq, Show)

instance I.ShortShow ChatRevenueTransactionType where
  shortShow ChatRevenueTransactionTypeEarnings
    { start_date = start_date_
    , end_date   = end_date_
    }
      = "ChatRevenueTransactionTypeEarnings"
        ++ I.cc
        [ "start_date" `I.p` start_date_
        , "end_date"   `I.p` end_date_
        ]
  shortShow ChatRevenueTransactionTypeWithdrawal
    { withdrawal_date = withdrawal_date_
    , provider        = provider_
    , state           = state_
    }
      = "ChatRevenueTransactionTypeWithdrawal"
        ++ I.cc
        [ "withdrawal_date" `I.p` withdrawal_date_
        , "provider"        `I.p` provider_
        , "state"           `I.p` state_
        ]
  shortShow ChatRevenueTransactionTypeRefund
    { refund_date = refund_date_
    , provider    = provider_
    }
      = "ChatRevenueTransactionTypeRefund"
        ++ I.cc
        [ "refund_date" `I.p` refund_date_
        , "provider"    `I.p` provider_
        ]

instance AT.FromJSON ChatRevenueTransactionType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatRevenueTransactionTypeEarnings"   -> parseChatRevenueTransactionTypeEarnings v
      "chatRevenueTransactionTypeWithdrawal" -> parseChatRevenueTransactionTypeWithdrawal v
      "chatRevenueTransactionTypeRefund"     -> parseChatRevenueTransactionTypeRefund v
      _                                      -> mempty
    
    where
      parseChatRevenueTransactionTypeEarnings :: A.Value -> AT.Parser ChatRevenueTransactionType
      parseChatRevenueTransactionTypeEarnings = A.withObject "ChatRevenueTransactionTypeEarnings" $ \o -> do
        start_date_ <- o A..:?  "start_date"
        end_date_   <- o A..:?  "end_date"
        pure $ ChatRevenueTransactionTypeEarnings
          { start_date = start_date_
          , end_date   = end_date_
          }
      parseChatRevenueTransactionTypeWithdrawal :: A.Value -> AT.Parser ChatRevenueTransactionType
      parseChatRevenueTransactionTypeWithdrawal = A.withObject "ChatRevenueTransactionTypeWithdrawal" $ \o -> do
        withdrawal_date_ <- o A..:?  "withdrawal_date"
        provider_        <- o A..:?  "provider"
        state_           <- o A..:?  "state"
        pure $ ChatRevenueTransactionTypeWithdrawal
          { withdrawal_date = withdrawal_date_
          , provider        = provider_
          , state           = state_
          }
      parseChatRevenueTransactionTypeRefund :: A.Value -> AT.Parser ChatRevenueTransactionType
      parseChatRevenueTransactionTypeRefund = A.withObject "ChatRevenueTransactionTypeRefund" $ \o -> do
        refund_date_ <- o A..:?  "refund_date"
        provider_    <- o A..:?  "provider"
        pure $ ChatRevenueTransactionTypeRefund
          { refund_date = refund_date_
          , provider    = provider_
          }
  parseJSON _ = mempty

