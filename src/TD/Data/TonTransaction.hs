module TD.Data.TonTransaction
  (TonTransaction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TonTransactionType as TonTransactionType

data TonTransaction
  = TonTransaction -- ^ Represents a transaction changing the amount of owned Toncoins
    { _id        :: Maybe T.Text                                -- ^ Unique identifier of the transaction
    , ton_amount :: Maybe Int                                   -- ^ The amount of added owned Toncoins; negative for outgoing transactions
    , is_refund  :: Maybe Bool                                  -- ^ True, if the transaction is a refund of a previous transaction
    , date       :: Maybe Int                                   -- ^ Point in time (Unix timestamp) when the transaction was completed
    , _type      :: Maybe TonTransactionType.TonTransactionType -- ^ Type of the transaction
    }
  deriving (Eq, Show)

instance I.ShortShow TonTransaction where
  shortShow TonTransaction
    { _id        = _id_
    , ton_amount = ton_amount_
    , is_refund  = is_refund_
    , date       = date_
    , _type      = _type_
    }
      = "TonTransaction"
        ++ I.cc
        [ "_id"        `I.p` _id_
        , "ton_amount" `I.p` ton_amount_
        , "is_refund"  `I.p` is_refund_
        , "date"       `I.p` date_
        , "_type"      `I.p` _type_
        ]

instance AT.FromJSON TonTransaction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonTransaction" -> parseTonTransaction v
      _                -> mempty
    
    where
      parseTonTransaction :: A.Value -> AT.Parser TonTransaction
      parseTonTransaction = A.withObject "TonTransaction" $ \o -> do
        _id_        <- o A..:?  "id"
        ton_amount_ <- o A..:?  "ton_amount"
        is_refund_  <- o A..:?  "is_refund"
        date_       <- o A..:?  "date"
        _type_      <- o A..:?  "type"
        pure $ TonTransaction
          { _id        = _id_
          , ton_amount = ton_amount_
          , is_refund  = is_refund_
          , date       = date_
          , _type      = _type_
          }
  parseJSON _ = mempty

