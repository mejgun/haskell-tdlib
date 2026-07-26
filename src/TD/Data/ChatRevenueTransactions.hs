module TD.Data.ChatRevenueTransactions
  (ChatRevenueTransactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatRevenueTransaction as ChatRevenueTransaction
import qualified Data.Text as T

data ChatRevenueTransactions
  = ChatRevenueTransactions -- ^ Contains a list of chat revenue transactions
    { gram_amount  :: Maybe Int                                             -- ^ The amount of owned TON Grams; in the smallest units of the cryptocurrency
    , transactions :: Maybe [ChatRevenueTransaction.ChatRevenueTransaction] -- ^ List of transactions
    , next_offset  :: Maybe T.Text                                          -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow ChatRevenueTransactions where
  shortShow ChatRevenueTransactions
    { gram_amount  = gram_amount_
    , transactions = transactions_
    , next_offset  = next_offset_
    }
      = "ChatRevenueTransactions"
        ++ I.cc
        [ "gram_amount"  `I.p` gram_amount_
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
        gram_amount_  <- o A..:?  "gram_amount"
        transactions_ <- o A..:?  "transactions"
        next_offset_  <- o A..:?  "next_offset"
        pure $ ChatRevenueTransactions
          { gram_amount  = gram_amount_
          , transactions = transactions_
          , next_offset  = next_offset_
          }
  parseJSON _ = mempty

