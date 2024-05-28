module TD.Data.StarTransaction
  (StarTransaction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.StarTransactionSource as StarTransactionSource

data StarTransaction
  = StarTransaction -- ^ Represents a transaction changing the amount of owned Telegram stars
    { _id        :: Maybe T.Text                                      -- ^ Unique identifier of the transaction
    , star_count :: Maybe Int                                         -- ^ The amount of added owned Telegram stars; negative for outgoing transactions
    , is_refund  :: Maybe Bool                                        -- ^ True, if the transaction is a refund of a previous transaction
    , date       :: Maybe Int                                         -- ^ Point in time (Unix timestamp) when the transaction was completed
    , source     :: Maybe StarTransactionSource.StarTransactionSource -- ^ Source of the transaction, or its recipient for outgoing transactions
    }
  deriving (Eq, Show)

instance I.ShortShow StarTransaction where
  shortShow StarTransaction
    { _id        = _id_
    , star_count = star_count_
    , is_refund  = is_refund_
    , date       = date_
    , source     = source_
    }
      = "StarTransaction"
        ++ I.cc
        [ "_id"        `I.p` _id_
        , "star_count" `I.p` star_count_
        , "is_refund"  `I.p` is_refund_
        , "date"       `I.p` date_
        , "source"     `I.p` source_
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
        _id_        <- o A..:?  "id"
        star_count_ <- o A..:?  "star_count"
        is_refund_  <- o A..:?  "is_refund"
        date_       <- o A..:?  "date"
        source_     <- o A..:?  "source"
        pure $ StarTransaction
          { _id        = _id_
          , star_count = star_count_
          , is_refund  = is_refund_
          , date       = date_
          , source     = source_
          }
  parseJSON _ = mempty

