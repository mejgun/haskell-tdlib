module TD.Data.TonWalletTransactionState
  (TonWalletTransactionState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes state of a transaction with a TON wallet
data TonWalletTransactionState
  = TonWalletTransactionStateSucceeded -- ^ The transaction succeeded
    { tx_hash :: Maybe T.Text -- ^ Hash of the transaction
    }
  | TonWalletTransactionStateFailed -- ^ The transaction failed
  deriving (Eq, Show)

instance I.ShortShow TonWalletTransactionState where
  shortShow TonWalletTransactionStateSucceeded
    { tx_hash = tx_hash_
    }
      = "TonWalletTransactionStateSucceeded"
        ++ I.cc
        [ "tx_hash" `I.p` tx_hash_
        ]
  shortShow TonWalletTransactionStateFailed
      = "TonWalletTransactionStateFailed"

instance AT.FromJSON TonWalletTransactionState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonWalletTransactionStateSucceeded" -> parseTonWalletTransactionStateSucceeded v
      "tonWalletTransactionStateFailed"    -> pure TonWalletTransactionStateFailed
      _                                    -> mempty
    
    where
      parseTonWalletTransactionStateSucceeded :: A.Value -> AT.Parser TonWalletTransactionState
      parseTonWalletTransactionStateSucceeded = A.withObject "TonWalletTransactionStateSucceeded" $ \o -> do
        tx_hash_ <- o A..:?  "tx_hash"
        pure $ TonWalletTransactionStateSucceeded
          { tx_hash = tx_hash_
          }
  parseJSON _ = mempty

