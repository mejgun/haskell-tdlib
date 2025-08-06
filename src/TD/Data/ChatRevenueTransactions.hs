module TD.Data.ChatRevenueTransactions
  (ChatRevenueTransactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatRevenueTransaction as ChatRevenueTransaction
import qualified Data.Text as T

data ChatRevenueTransactions
  = ChatRevenueTransactions -- ^ Contains a list of chat revenue transactions
    { ton_amount   :: Maybe Int                                             -- ^ The amount of owned Toncoins; in the smallest units of the cryptocurrency
    , transactions :: Maybe [ChatRevenueTransaction.ChatRevenueTransaction] -- ^ List of transactions
    , next_offset  :: Maybe T.Text                                          -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow ChatRevenueTransactions where
  shortShow ChatRevenueTransactions
    { ton_amount   = ton_amount_
    , transactions = transactions_
    , next_offset  = next_offset_
    }
      = "ChatRevenueTransactions"
        ++ I.cc
        [ "ton_amount"   `I.p` ton_amount_
        , "transactions" `I.p` transactions_
        , "next_offset"  `I.p` next_offset_
        ]

instance AT.FromJSON ChatRevenueTransactions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatRevenueTransactions" -> parseChatRevenueTransactions v
      _                         -> mempty
    
    where
      parseChatRevenueTransactions :: A.Value -> AT.Parser ChatRevenueTransactions
      parseChatRevenueTransactions = A.withObject "ChatRevenueTransactions" $ \o -> do
        ton_amount_   <- o A..:?  "ton_amount"
        transactions_ <- o A..:?  "transactions"
        next_offset_  <- o A..:?  "next_offset"
        pure $ ChatRevenueTransactions
          { ton_amount   = ton_amount_
          , transactions = transactions_
          , next_offset  = next_offset_
          }
  parseJSON _ = mempty

