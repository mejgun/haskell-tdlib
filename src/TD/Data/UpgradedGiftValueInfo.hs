module TD.Data.UpgradedGiftValueInfo
  (UpgradedGiftValueInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data UpgradedGiftValueInfo
  = UpgradedGiftValueInfo -- ^ Contains information about value of an upgraded gift
    { currency                   :: Maybe T.Text -- ^ ISO 4217 currency code of the currency in which the prices are represented
    , value                      :: Maybe Int    -- ^ Estimated value of the gift; in the smallest units of the currency
    , is_value_average           :: Maybe Bool   -- ^ True, if the value is calculated as average value of similar sold gifts. Otherwise, it is based on the sale price of the gift
    , initial_sale_date          :: Maybe Int    -- ^ Point in time (Unix timestamp) when the corresponding regular gift was originally purchased
    , initial_sale_star_count    :: Maybe Int    -- ^ Amount of Telegram Stars that were paid for the gift
    , initial_sale_price         :: Maybe Int    -- ^ Initial price of the gift; in the smallest units of the currency
    , last_sale_date             :: Maybe Int    -- ^ Point in time (Unix timestamp) when the upgraded gift was purchased last time; 0 if never
    , last_sale_price            :: Maybe Int    -- ^ Last purchase price of the gift; in the smallest units of the currency; 0 if the gift has never been resold
    , is_last_sale_on_fragment   :: Maybe Bool   -- ^ True, if the last sale was completed on Fragment
    , minimum_price              :: Maybe Int    -- ^ The current minimum price of gifts upgraded from the same gift; in the smallest units of the currency; 0 if there are no such gifts
    , average_sale_price         :: Maybe Int    -- ^ The average sale price in the last month of gifts upgraded from the same gift; in the smallest units of the currency; 0 if there were no such sales
    , telegram_listed_gift_count :: Maybe Int    -- ^ Number of gifts upgraded from the same gift being resold on Telegram
    , fragment_listed_gift_count :: Maybe Int    -- ^ Number of gifts upgraded from the same gift being resold on Fragment
    , fragment_url               :: Maybe T.Text -- ^ The HTTPS link to the Fragment for the gift; may be empty if there are no such gifts being sold on Fragment
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftValueInfo where
  shortShow UpgradedGiftValueInfo
    { currency                   = currency_
    , value                      = value_
    , is_value_average           = is_value_average_
    , initial_sale_date          = initial_sale_date_
    , initial_sale_star_count    = initial_sale_star_count_
    , initial_sale_price         = initial_sale_price_
    , last_sale_date             = last_sale_date_
    , last_sale_price            = last_sale_price_
    , is_last_sale_on_fragment   = is_last_sale_on_fragment_
    , minimum_price              = minimum_price_
    , average_sale_price         = average_sale_price_
    , telegram_listed_gift_count = telegram_listed_gift_count_
    , fragment_listed_gift_count = fragment_listed_gift_count_
    , fragment_url               = fragment_url_
    }
      = "UpgradedGiftValueInfo"
        ++ I.cc
        [ "currency"                   `I.p` currency_
        , "value"                      `I.p` value_
        , "is_value_average"           `I.p` is_value_average_
        , "initial_sale_date"          `I.p` initial_sale_date_
        , "initial_sale_star_count"    `I.p` initial_sale_star_count_
        , "initial_sale_price"         `I.p` initial_sale_price_
        , "last_sale_date"             `I.p` last_sale_date_
        , "last_sale_price"            `I.p` last_sale_price_
        , "is_last_sale_on_fragment"   `I.p` is_last_sale_on_fragment_
        , "minimum_price"              `I.p` minimum_price_
        , "average_sale_price"         `I.p` average_sale_price_
        , "telegram_listed_gift_count" `I.p` telegram_listed_gift_count_
        , "fragment_listed_gift_count" `I.p` fragment_listed_gift_count_
        , "fragment_url"               `I.p` fragment_url_
        ]

instance AT.FromJSON UpgradedGiftValueInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftValueInfo" -> parseUpgradedGiftValueInfo v
      _                       -> mempty
    
    where
      parseUpgradedGiftValueInfo :: A.Value -> AT.Parser UpgradedGiftValueInfo
      parseUpgradedGiftValueInfo = A.withObject "UpgradedGiftValueInfo" $ \o -> do
        currency_                   <- o A..:?  "currency"
        value_                      <- o A..:?  "value"
        is_value_average_           <- o A..:?  "is_value_average"
        initial_sale_date_          <- o A..:?  "initial_sale_date"
        initial_sale_star_count_    <- o A..:?  "initial_sale_star_count"
        initial_sale_price_         <- o A..:?  "initial_sale_price"
        last_sale_date_             <- o A..:?  "last_sale_date"
        last_sale_price_            <- o A..:?  "last_sale_price"
        is_last_sale_on_fragment_   <- o A..:?  "is_last_sale_on_fragment"
        minimum_price_              <- o A..:?  "minimum_price"
        average_sale_price_         <- o A..:?  "average_sale_price"
        telegram_listed_gift_count_ <- o A..:?  "telegram_listed_gift_count"
        fragment_listed_gift_count_ <- o A..:?  "fragment_listed_gift_count"
        fragment_url_               <- o A..:?  "fragment_url"
        pure $ UpgradedGiftValueInfo
          { currency                   = currency_
          , value                      = value_
          , is_value_average           = is_value_average_
          , initial_sale_date          = initial_sale_date_
          , initial_sale_star_count    = initial_sale_star_count_
          , initial_sale_price         = initial_sale_price_
          , last_sale_date             = last_sale_date_
          , last_sale_price            = last_sale_price_
          , is_last_sale_on_fragment   = is_last_sale_on_fragment_
          , minimum_price              = minimum_price_
          , average_sale_price         = average_sale_price_
          , telegram_listed_gift_count = telegram_listed_gift_count_
          , fragment_listed_gift_count = fragment_listed_gift_count_
          , fragment_url               = fragment_url_
          }
  parseJSON _ = mempty

