module TD.Data.ChatRevenueAmount
  (ChatRevenueAmount(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data ChatRevenueAmount
  = ChatRevenueAmount -- ^ Contains information about revenue earned from sponsored messages in a chat
    { cryptocurrency     :: Maybe T.Text -- ^ Cryptocurrency in which revenue is calculated
    , total_amount       :: Maybe Int    -- ^ Total amount of the cryptocurrency earned, in the smallest units of the cryptocurrency
    , balance_amount     :: Maybe Int    -- ^ Amount of the cryptocurrency that isn't withdrawn yet, in the smallest units of the cryptocurrency
    , available_amount   :: Maybe Int    -- ^ Amount of the cryptocurrency available for withdrawal, in the smallest units of the cryptocurrency
    , withdrawal_enabled :: Maybe Bool   -- ^ True, if Telegram Stars can be withdrawn now or later
    }
  deriving (Eq, Show)

instance I.ShortShow ChatRevenueAmount where
  shortShow ChatRevenueAmount
    { cryptocurrency     = cryptocurrency_
    , total_amount       = total_amount_
    , balance_amount     = balance_amount_
    , available_amount   = available_amount_
    , withdrawal_enabled = withdrawal_enabled_
    }
      = "ChatRevenueAmount"
        ++ I.cc
        [ "cryptocurrency"     `I.p` cryptocurrency_
        , "total_amount"       `I.p` total_amount_
        , "balance_amount"     `I.p` balance_amount_
        , "available_amount"   `I.p` available_amount_
        , "withdrawal_enabled" `I.p` withdrawal_enabled_
        ]

instance AT.FromJSON ChatRevenueAmount where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatRevenueAmount" -> parseChatRevenueAmount v
      _                   -> mempty
    
    where
      parseChatRevenueAmount :: A.Value -> AT.Parser ChatRevenueAmount
      parseChatRevenueAmount = A.withObject "ChatRevenueAmount" $ \o -> do
        cryptocurrency_     <- o A..:?                       "cryptocurrency"
        total_amount_       <- fmap I.readInt64 <$> o A..:?  "total_amount"
        balance_amount_     <- fmap I.readInt64 <$> o A..:?  "balance_amount"
        available_amount_   <- fmap I.readInt64 <$> o A..:?  "available_amount"
        withdrawal_enabled_ <- o A..:?                       "withdrawal_enabled"
        pure $ ChatRevenueAmount
          { cryptocurrency     = cryptocurrency_
          , total_amount       = total_amount_
          , balance_amount     = balance_amount_
          , available_amount   = available_amount_
          , withdrawal_enabled = withdrawal_enabled_
          }
  parseJSON _ = mempty

