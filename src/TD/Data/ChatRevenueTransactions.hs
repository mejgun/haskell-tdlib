module TD.Data.ChatRevenueTransactions
  (ChatRevenueTransactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatRevenueTransaction as ChatRevenueTransaction

data ChatRevenueTransactions
  = ChatRevenueTransactions -- ^ Contains a list of chat revenue transactions
    { total_count  :: Maybe Int                                             -- ^ Total number of transactions
    , transactions :: Maybe [ChatRevenueTransaction.ChatRevenueTransaction] -- ^ List of transactions
    }
  deriving (Eq, Show)

instance I.ShortShow ChatRevenueTransactions where
  shortShow ChatRevenueTransactions
    { total_count  = total_count_
    , transactions = transactions_
    }
      = "ChatRevenueTransactions"
        ++ I.cc
        [ "total_count"  `I.p` total_count_
        , "transactions" `I.p` transactions_
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
        total_count_  <- o A..:?  "total_count"
        transactions_ <- o A..:?  "transactions"
        pure $ ChatRevenueTransactions
          { total_count  = total_count_
          , transactions = transactions_
          }
  parseJSON _ = mempty

