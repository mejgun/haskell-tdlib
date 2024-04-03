module TD.Data.CollectibleItemInfo
  (CollectibleItemInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data CollectibleItemInfo
  = CollectibleItemInfo -- ^ Contains information about a collectible item and its last purchase
    { purchase_date         :: Maybe Int    -- ^ Point in time (Unix timestamp) when the item was purchased
    , currency              :: Maybe T.Text -- ^ Currency for the paid amount
    , amount                :: Maybe Int    -- ^ The paid amount, in the smallest units of the currency
    , cryptocurrency        :: Maybe T.Text -- ^ Cryptocurrency used to pay for the item
    , cryptocurrency_amount :: Maybe Int    -- ^ The paid amount, in the smallest units of the cryptocurrency
    , url                   :: Maybe T.Text -- ^ Individual URL for the item on https://fragment.com
    }
  deriving (Eq, Show)

instance I.ShortShow CollectibleItemInfo where
  shortShow CollectibleItemInfo
    { purchase_date         = purchase_date_
    , currency              = currency_
    , amount                = amount_
    , cryptocurrency        = cryptocurrency_
    , cryptocurrency_amount = cryptocurrency_amount_
    , url                   = url_
    }
      = "CollectibleItemInfo"
        ++ I.cc
        [ "purchase_date"         `I.p` purchase_date_
        , "currency"              `I.p` currency_
        , "amount"                `I.p` amount_
        , "cryptocurrency"        `I.p` cryptocurrency_
        , "cryptocurrency_amount" `I.p` cryptocurrency_amount_
        , "url"                   `I.p` url_
        ]

instance AT.FromJSON CollectibleItemInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "collectibleItemInfo" -> parseCollectibleItemInfo v
      _                     -> mempty
    
    where
      parseCollectibleItemInfo :: A.Value -> AT.Parser CollectibleItemInfo
      parseCollectibleItemInfo = A.withObject "CollectibleItemInfo" $ \o -> do
        purchase_date_         <- o A..:?                       "purchase_date"
        currency_              <- o A..:?                       "currency"
        amount_                <- o A..:?                       "amount"
        cryptocurrency_        <- o A..:?                       "cryptocurrency"
        cryptocurrency_amount_ <- fmap I.readInt64 <$> o A..:?  "cryptocurrency_amount"
        url_                   <- o A..:?                       "url"
        pure $ CollectibleItemInfo
          { purchase_date         = purchase_date_
          , currency              = currency_
          , amount                = amount_
          , cryptocurrency        = cryptocurrency_
          , cryptocurrency_amount = cryptocurrency_amount_
          , url                   = url_
          }
  parseJSON _ = mempty

