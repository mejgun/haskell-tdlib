module TD.Data.ChatRevenueTransaction
  (ChatRevenueTransaction(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ChatRevenueTransactionType as ChatRevenueTransactionType

data ChatRevenueTransaction
  = ChatRevenueTransaction -- ^ Contains a chat revenue transactions
    { cryptocurrency        :: Maybe T.Text                                                -- ^ Cryptocurrency in which revenue is calculated
    , cryptocurrency_amount :: Maybe Int                                                   -- ^ The withdrawn amount, in the smallest units of the cryptocurrency
    , _type                 :: Maybe ChatRevenueTransactionType.ChatRevenueTransactionType -- ^ Type of the transaction
    }
  deriving (Eq, Show)

instance I.ShortShow ChatRevenueTransaction where
  shortShow ChatRevenueTransaction
    { cryptocurrency        = cryptocurrency_
    , cryptocurrency_amount = cryptocurrency_amount_
    , _type                 = _type_
    }
      = "ChatRevenueTransaction"
        ++ I.cc
        [ "cryptocurrency"        `I.p` cryptocurrency_
        , "cryptocurrency_amount" `I.p` cryptocurrency_amount_
        , "_type"                 `I.p` _type_
        ]

instance AT.FromJSON ChatRevenueTransaction where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatRevenueTransaction" -> parseChatRevenueTransaction v
      _                        -> mempty
    
    where
      parseChatRevenueTransaction :: A.Value -> AT.Parser ChatRevenueTransaction
      parseChatRevenueTransaction = A.withObject "ChatRevenueTransaction" $ \o -> do
        cryptocurrency_        <- o A..:?                       "cryptocurrency"
        cryptocurrency_amount_ <- fmap I.readInt64 <$> o A..:?  "cryptocurrency_amount"
        _type_                 <- o A..:?                       "type"
        pure $ ChatRevenueTransaction
          { cryptocurrency        = cryptocurrency_
          , cryptocurrency_amount = cryptocurrency_amount_
          , _type                 = _type_
          }
  parseJSON _ = mempty

