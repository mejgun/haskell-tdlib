module TD.Data.StarTransaction
  (StarTransaction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.StarTransactionPartner as StarTransactionPartner

data StarTransaction
  = StarTransaction -- ^ Represents a transaction changing the amount of owned Telegram stars
    { _id        :: Maybe T.Text                                        -- ^ Unique identifier of the transaction
    , star_count :: Maybe Int                                           -- ^ The amount of added owned Telegram stars; negative for outgoing transactions
    , is_refund  :: Maybe Bool                                          -- ^ True, if the transaction is a refund of a previous transaction
    , date       :: Maybe Int                                           -- ^ Point in time (Unix timestamp) when the transaction was completed
    , partner    :: Maybe StarTransactionPartner.StarTransactionPartner -- ^ Source of the incoming transaction, or its recipient for outgoing transactions
    }
  deriving (Eq, Show)

instance I.ShortShow StarTransaction where
  shortShow StarTransaction
    { _id        = _id_
    , star_count = star_count_
    , is_refund  = is_refund_
    , date       = date_
    , partner    = partner_
    }
      = "StarTransaction"
        ++ I.cc
        [ "_id"        `I.p` _id_
        , "star_count" `I.p` star_count_
        , "is_refund"  `I.p` is_refund_
        , "date"       `I.p` date_
        , "partner"    `I.p` partner_
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
        partner_    <- o A..:?  "partner"
        pure $ StarTransaction
          { _id        = _id_
          , star_count = star_count_
          , is_refund  = is_refund_
          , date       = date_
          , partner    = partner_
          }
  parseJSON _ = mempty

