module TD.Data.TonWalletTransferResult
  (TonWalletTransferResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified TD.Data.TonWalletTransaction as TonWalletTransaction

data TonWalletTransferResult
  = TonWalletTransferResult -- ^ Represents result of cryptocurrency transfer from the current user's TON wallet
    { is_gasless  :: Maybe Bool                                      -- ^ True, if the transfer is gasless
    , msg_hash    :: Maybe BS.ByteString                             -- ^ Unique identifier of the sent message; use getTonWalletTransactionByMsgHash to poll information about the transaction
    , transaction :: Maybe TonWalletTransaction.TonWalletTransaction -- ^ The completed transaction; may be null if the transaction is still pending
    }
  deriving (Eq, Show)

instance I.ShortShow TonWalletTransferResult where
  shortShow TonWalletTransferResult
    { is_gasless  = is_gasless_
    , msg_hash    = msg_hash_
    , transaction = transaction_
    }
      = "TonWalletTransferResult"
        ++ I.cc
        [ "is_gasless"  `I.p` is_gasless_
        , "msg_hash"    `I.p` msg_hash_
        , "transaction" `I.p` transaction_
        ]

instance AT.FromJSON TonWalletTransferResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonWalletTransferResult" -> parseTonWalletTransferResult v
      _                         -> mempty
    
    where
      parseTonWalletTransferResult :: A.Value -> AT.Parser TonWalletTransferResult
      parseTonWalletTransferResult = A.withObject "TonWalletTransferResult" $ \o -> do
        is_gasless_  <- o A..:?                       "is_gasless"
        msg_hash_    <- fmap I.readBytes <$> o A..:?  "msg_hash"
        transaction_ <- o A..:?                       "transaction"
        pure $ TonWalletTransferResult
          { is_gasless  = is_gasless_
          , msg_hash    = msg_hash_
          , transaction = transaction_
          }
  parseJSON _ = mempty

