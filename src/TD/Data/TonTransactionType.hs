module TD.Data.TonTransactionType
  (TonTransactionType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Sticker as Sticker

-- | Describes type of transaction with Toncoins
data TonTransactionType
  = TonTransactionTypeFragmentDeposit -- ^ The transaction is a deposit of Toncoins from Fragment
    { is_gift :: Maybe Bool            -- ^ True, if the transaction is a gift from another user
    , sticker :: Maybe Sticker.Sticker -- ^ The sticker to be shown in the transaction information; may be null if unknown
    }
  | TonTransactionTypeSuggestedPostPayment -- ^ The transaction is a payment for a suggested post
    { chat_id :: Maybe Int -- ^ Identifier of the channel chat that posted the post
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
  shortShow TonTransactionTypeUnsupported
      = "TonTransactionTypeUnsupported"

instance AT.FromJSON TonTransactionType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonTransactionTypeFragmentDeposit"      -> parseTonTransactionTypeFragmentDeposit v
      "tonTransactionTypeSuggestedPostPayment" -> parseTonTransactionTypeSuggestedPostPayment v
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
  parseJSON _ = mempty

