module TD.Data.ChatRevenueTransactionType
  (ChatRevenueTransactionType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.RevenueWithdrawalState as RevenueWithdrawalState

-- | Describes type of transaction for revenue earned from sponsored messages in a chat
data ChatRevenueTransactionType
  = ChatRevenueTransactionTypeUnsupported -- ^ Describes an unsupported transaction
  | ChatRevenueTransactionTypeSponsoredMessageEarnings -- ^ Describes earnings from sponsored messages in a chat in some time frame
    { start_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the earnings started
    , end_date   :: Maybe Int -- ^ Point in time (Unix timestamp) when the earnings ended
    }
  | ChatRevenueTransactionTypeSuggestedPostEarnings -- ^ Describes earnings from a published suggested post
    { user_id :: Maybe Int -- ^ Identifier of the user that paid for the suggested post
    }
  | ChatRevenueTransactionTypeFragmentWithdrawal -- ^ Describes a withdrawal of earnings through Fragment
    { withdrawal_date :: Maybe Int                                           -- ^ Point in time (Unix timestamp) when the earnings withdrawal started
    , state           :: Maybe RevenueWithdrawalState.RevenueWithdrawalState -- ^ State of the withdrawal
    }
  | ChatRevenueTransactionTypeFragmentRefund -- ^ Describes a refund for failed withdrawal of earnings through Fragment
    { refund_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the transaction was refunded
    }
  deriving (Eq, Show)

instance I.ShortShow ChatRevenueTransactionType where
  shortShow ChatRevenueTransactionTypeUnsupported
      = "ChatRevenueTransactionTypeUnsupported"
  shortShow ChatRevenueTransactionTypeSponsoredMessageEarnings
    { start_date = start_date_
    , end_date   = end_date_
    }
      = "ChatRevenueTransactionTypeSponsoredMessageEarnings"
        ++ I.cc
        [ "start_date" `I.p` start_date_
        , "end_date"   `I.p` end_date_
        ]
  shortShow ChatRevenueTransactionTypeSuggestedPostEarnings
    { user_id = user_id_
    }
      = "ChatRevenueTransactionTypeSuggestedPostEarnings"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        ]
  shortShow ChatRevenueTransactionTypeFragmentWithdrawal
    { withdrawal_date = withdrawal_date_
    , state           = state_
    }
      = "ChatRevenueTransactionTypeFragmentWithdrawal"
        ++ I.cc
        [ "withdrawal_date" `I.p` withdrawal_date_
        , "state"           `I.p` state_
        ]
  shortShow ChatRevenueTransactionTypeFragmentRefund
    { refund_date = refund_date_
    }
      = "ChatRevenueTransactionTypeFragmentRefund"
        ++ I.cc
        [ "refund_date" `I.p` refund_date_
        ]

instance AT.FromJSON ChatRevenueTransactionType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatRevenueTransactionTypeUnsupported"              -> pure ChatRevenueTransactionTypeUnsupported
      "chatRevenueTransactionTypeSponsoredMessageEarnings" -> parseChatRevenueTransactionTypeSponsoredMessageEarnings v
      "chatRevenueTransactionTypeSuggestedPostEarnings"    -> parseChatRevenueTransactionTypeSuggestedPostEarnings v
      "chatRevenueTransactionTypeFragmentWithdrawal"       -> parseChatRevenueTransactionTypeFragmentWithdrawal v
      "chatRevenueTransactionTypeFragmentRefund"           -> parseChatRevenueTransactionTypeFragmentRefund v
      _                                                    -> mempty
    
    where
      parseChatRevenueTransactionTypeSponsoredMessageEarnings :: A.Value -> AT.Parser ChatRevenueTransactionType
      parseChatRevenueTransactionTypeSponsoredMessageEarnings = A.withObject "ChatRevenueTransactionTypeSponsoredMessageEarnings" $ \o -> do
        start_date_ <- o A..:?  "start_date"
        end_date_   <- o A..:?  "end_date"
        pure $ ChatRevenueTransactionTypeSponsoredMessageEarnings
          { start_date = start_date_
          , end_date   = end_date_
          }
      parseChatRevenueTransactionTypeSuggestedPostEarnings :: A.Value -> AT.Parser ChatRevenueTransactionType
      parseChatRevenueTransactionTypeSuggestedPostEarnings = A.withObject "ChatRevenueTransactionTypeSuggestedPostEarnings" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        pure $ ChatRevenueTransactionTypeSuggestedPostEarnings
          { user_id = user_id_
          }
      parseChatRevenueTransactionTypeFragmentWithdrawal :: A.Value -> AT.Parser ChatRevenueTransactionType
      parseChatRevenueTransactionTypeFragmentWithdrawal = A.withObject "ChatRevenueTransactionTypeFragmentWithdrawal" $ \o -> do
        withdrawal_date_ <- o A..:?  "withdrawal_date"
        state_           <- o A..:?  "state"
        pure $ ChatRevenueTransactionTypeFragmentWithdrawal
          { withdrawal_date = withdrawal_date_
          , state           = state_
          }
      parseChatRevenueTransactionTypeFragmentRefund :: A.Value -> AT.Parser ChatRevenueTransactionType
      parseChatRevenueTransactionTypeFragmentRefund = A.withObject "ChatRevenueTransactionTypeFragmentRefund" $ \o -> do
        refund_date_ <- o A..:?  "refund_date"
        pure $ ChatRevenueTransactionTypeFragmentRefund
          { refund_date = refund_date_
          }
  parseJSON _ = mempty

