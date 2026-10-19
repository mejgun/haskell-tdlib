module TD.Data.TonWalletTransaction
  (TonWalletTransaction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TonWalletTransactionState as TonWalletTransactionState
import qualified TD.Data.TonWalletTransactionType as TonWalletTransactionType

data TonWalletTransaction
  = TonWalletTransaction -- ^ Represents a transaction with the TON wallet of the current user
    { _id          :: Maybe T.Text                                              -- ^ Unique identifier of the transaction
    , peer_address :: Maybe T.Text                                              -- ^ Address in the TON blockchain of the transaction peer; may be empty if the transaction isn't a wallet transfer
    , peer_user_id :: Maybe Int                                                 -- ^ Identifier of the other user who participated in the transaction; 0 if unknown
    , peer_domain  :: Maybe T.Text                                              -- ^ Identifier of the domain assigned to the peer address; may be empty if none
    , date         :: Maybe Int                                                 -- ^ Point in time (Unix timestamp) when the transaction was completed
    , fee_amount   :: Maybe Int                                                 -- ^ The fee amount paid for the transaction in TON Grams, in the smallest units of the cryptocurrency
    , state        :: Maybe TonWalletTransactionState.TonWalletTransactionState -- ^ State of the transaction
    , _type        :: Maybe TonWalletTransactionType.TonWalletTransactionType   -- ^ Type of the transaction
    }
  deriving (Eq, Show)

instance I.ShortShow TonWalletTransaction where
  shortShow TonWalletTransaction
    { _id          = _id_
    , peer_address = peer_address_
    , peer_user_id = peer_user_id_
    , peer_domain  = peer_domain_
    , date         = date_
    , fee_amount   = fee_amount_
    , state        = state_
    , _type        = _type_
    }
      = "TonWalletTransaction"
        ++ I.cc
        [ "_id"          `I.p` _id_
        , "peer_address" `I.p` peer_address_
        , "peer_user_id" `I.p` peer_user_id_
        , "peer_domain"  `I.p` peer_domain_
        , "date"         `I.p` date_
        , "fee_amount"   `I.p` fee_amount_
        , "state"        `I.p` state_
        , "_type"        `I.p` _type_
        ]

instance AT.FromJSON TonWalletTransaction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonWalletTransaction" -> parseTonWalletTransaction v
      _                      -> mempty
    
    where
      parseTonWalletTransaction :: A.Value -> AT.Parser TonWalletTransaction
      parseTonWalletTransaction = A.withObject "TonWalletTransaction" $ \o -> do
        _id_          <- o A..:?  "id"
        peer_address_ <- o A..:?  "peer_address"
        peer_user_id_ <- o A..:?  "peer_user_id"
        peer_domain_  <- o A..:?  "peer_domain"
        date_         <- o A..:?  "date"
        fee_amount_   <- o A..:?  "fee_amount"
        state_        <- o A..:?  "state"
        _type_        <- o A..:?  "type"
        pure $ TonWalletTransaction
          { _id          = _id_
          , peer_address = peer_address_
          , peer_user_id = peer_user_id_
          , peer_domain  = peer_domain_
          , date         = date_
          , fee_amount   = fee_amount_
          , state        = state_
          , _type        = _type_
          }
  parseJSON _ = mempty

