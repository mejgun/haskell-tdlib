module TD.Data.StarTransaction
  (StarTransaction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.StarAmount as StarAmount
import qualified TD.Data.StarTransactionType as StarTransactionType

data StarTransaction
  = StarTransaction -- ^ Represents a transaction changing the amount of owned Telegram Stars
    { _id         :: Maybe T.Text                                  -- ^ Unique identifier of the transaction
    , star_amount :: Maybe StarAmount.StarAmount                   -- ^ The amount of added owned Telegram Stars; negative for outgoing transactions
    , is_refund   :: Maybe Bool                                    -- ^ True, if the transaction is a refund of a previous transaction
    , date        :: Maybe Int                                     -- ^ Point in time (Unix timestamp) when the transaction was completed
    , _type       :: Maybe StarTransactionType.StarTransactionType -- ^ Type of the transaction
    }
  deriving (Eq, Show)

instance I.ShortShow StarTransaction where
  shortShow StarTransaction
    { _id         = _id_
    , star_amount = star_amount_
    , is_refund   = is_refund_
    , date        = date_
    , _type       = _type_
    }
      = "StarTransaction"
        ++ I.cc
        [ "_id"         `I.p` _id_
        , "star_amount" `I.p` star_amount_
        , "is_refund"   `I.p` is_refund_
        , "date"        `I.p` date_
        , "_type"       `I.p` _type_
        ]

instance AT.FromJSON StarTransaction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starTransaction" -> parseStarTransaction v
      _                 -> mempty
    
    where
      parseStarTransaction :: A.Value -> AT.Parser StarTransaction
      parseStarTransaction = A.withObject "StarTransaction" $ \o -> do
        _id_         <- o A..:?  "id"
        star_amount_ <- o A..:?  "star_amount"
        is_refund_   <- o A..:?  "is_refund"
        date_        <- o A..:?  "date"
        _type_       <- o A..:?  "type"
        pure $ StarTransaction
          { _id         = _id_
          , star_amount = star_amount_
          , is_refund   = is_refund_
          , date        = date_
          , _type       = _type_
          }
  parseJSON _ = mempty

