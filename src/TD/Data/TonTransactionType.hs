module TD.Data.TonTransactionType
  (TonTransactionType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.UpgradedGift as UpgradedGift

-- | Describes type of transaction with Toncoins
data TonTransactionType
  = TonTransactionTypeFragmentDeposit -- ^ The transaction is a deposit of Toncoins from Fragment
    { is_gift :: Maybe Bool            -- ^ True, if the transaction is a gift from another user
    , sticker :: Maybe Sticker.Sticker -- ^ The sticker to be shown in the transaction information; may be null if unknown
    }
  | TonTransactionTypeSuggestedPostPayment -- ^ The transaction is a payment for a suggested post
    { chat_id :: Maybe Int -- ^ Identifier of the channel chat that posted the post
    }
  | TonTransactionTypeUpgradedGiftPurchase -- ^ The transaction is a purchase of an upgraded gift for some user or channel; for regular users only
    { user_id :: Maybe Int                       -- ^ Identifier of the user that sold the gift
    , gift    :: Maybe UpgradedGift.UpgradedGift -- ^ The gift
    }
  | TonTransactionTypeUpgradedGiftSale -- ^ The transaction is a sale of an upgraded gift; for regular users only
    { user_id                   :: Maybe Int                       -- ^ Identifier of the user that bought the gift
    , gift                      :: Maybe UpgradedGift.UpgradedGift -- ^ The gift
    , commission_per_mille      :: Maybe Int                       -- ^ The number of Toncoins received by the Telegram for each 1000 Toncoins received by the seller of the gift
    , commission_toncoin_amount :: Maybe Int                       -- ^ The amount of Toncoins that were received by the Telegram; in the smallest units of the currency
    }
  | TonTransactionTypeUnsupported -- ^ The transaction is a transaction of an unsupported type
  deriving (Eq, Show)

instance I.ShortShow TonTransactionType where
  shortShow TonTransactionTypeFragmentDeposit
    { is_gift = is_gift_
    , sticker = sticker_
    }
      = "TonTransactionTypeFragmentDeposit"
        ++ I.cc
        [ "is_gift" `I.p` is_gift_
        , "sticker" `I.p` sticker_
        ]
  shortShow TonTransactionTypeSuggestedPostPayment
    { chat_id = chat_id_
    }
      = "TonTransactionTypeSuggestedPostPayment"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]
  shortShow TonTransactionTypeUpgradedGiftPurchase
    { user_id = user_id_
    , gift    = gift_
    }
      = "TonTransactionTypeUpgradedGiftPurchase"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        , "gift"    `I.p` gift_
        ]
  shortShow TonTransactionTypeUpgradedGiftSale
    { user_id                   = user_id_
    , gift                      = gift_
    , commission_per_mille      = commission_per_mille_
    , commission_toncoin_amount = commission_toncoin_amount_
    }
      = "TonTransactionTypeUpgradedGiftSale"
        ++ I.cc
        [ "user_id"                   `I.p` user_id_
        , "gift"                      `I.p` gift_
        , "commission_per_mille"      `I.p` commission_per_mille_
        , "commission_toncoin_amount" `I.p` commission_toncoin_amount_
        ]
  shortShow TonTransactionTypeUnsupported
      = "TonTransactionTypeUnsupported"

instance AT.FromJSON TonTransactionType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonTransactionTypeFragmentDeposit"      -> parseTonTransactionTypeFragmentDeposit v
      "tonTransactionTypeSuggestedPostPayment" -> parseTonTransactionTypeSuggestedPostPayment v
      "tonTransactionTypeUpgradedGiftPurchase" -> parseTonTransactionTypeUpgradedGiftPurchase v
      "tonTransactionTypeUpgradedGiftSale"     -> parseTonTransactionTypeUpgradedGiftSale v
      "tonTransactionTypeUnsupported"          -> pure TonTransactionTypeUnsupported
      _                                        -> mempty
    
    where
      parseTonTransactionTypeFragmentDeposit :: A.Value -> AT.Parser TonTransactionType
      parseTonTransactionTypeFragmentDeposit = A.withObject "TonTransactionTypeFragmentDeposit" $ \o -> do
        is_gift_ <- o A..:?  "is_gift"
        sticker_ <- o A..:?  "sticker"
        pure $ TonTransactionTypeFragmentDeposit
          { is_gift = is_gift_
          , sticker = sticker_
          }
      parseTonTransactionTypeSuggestedPostPayment :: A.Value -> AT.Parser TonTransactionType
      parseTonTransactionTypeSuggestedPostPayment = A.withObject "TonTransactionTypeSuggestedPostPayment" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ TonTransactionTypeSuggestedPostPayment
          { chat_id = chat_id_
          }
      parseTonTransactionTypeUpgradedGiftPurchase :: A.Value -> AT.Parser TonTransactionType
      parseTonTransactionTypeUpgradedGiftPurchase = A.withObject "TonTransactionTypeUpgradedGiftPurchase" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        gift_    <- o A..:?  "gift"
        pure $ TonTransactionTypeUpgradedGiftPurchase
          { user_id = user_id_
          , gift    = gift_
          }
      parseTonTransactionTypeUpgradedGiftSale :: A.Value -> AT.Parser TonTransactionType
      parseTonTransactionTypeUpgradedGiftSale = A.withObject "TonTransactionTypeUpgradedGiftSale" $ \o -> do
        user_id_                   <- o A..:?  "user_id"
        gift_                      <- o A..:?  "gift"
        commission_per_mille_      <- o A..:?  "commission_per_mille"
        commission_toncoin_amount_ <- o A..:?  "commission_toncoin_amount"
        pure $ TonTransactionTypeUpgradedGiftSale
          { user_id                   = user_id_
          , gift                      = gift_
          , commission_per_mille      = commission_per_mille_
          , commission_toncoin_amount = commission_toncoin_amount_
          }
  parseJSON _ = mempty

