module TD.Data.TonWalletGaslessTransfersInfo
  (TonWalletGaslessTransfersInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data TonWalletGaslessTransfersInfo
  = TonWalletGaslessTransfersInfo -- ^ Represents state of gasless transfers for the current user
    { left_count      :: Maybe Int    -- ^ Number of left gasless transfers. The daily available number of gasless transfers is available as getOption("ton_wallet_gasless_transfer_daily_count_max")
    , reset_date      :: Maybe Int    -- ^ Point in time (Unix timestamp) when the number of left transfers will be reset; 0 if never
    , relayer_address :: Maybe T.Text -- ^ Address of the relayer for gasless transfers; may be empty if unavailable
    }
  deriving (Eq, Show)

instance I.ShortShow TonWalletGaslessTransfersInfo where
  shortShow TonWalletGaslessTransfersInfo
    { left_count      = left_count_
    , reset_date      = reset_date_
    , relayer_address = relayer_address_
    }
      = "TonWalletGaslessTransfersInfo"
        ++ I.cc
        [ "left_count"      `I.p` left_count_
        , "reset_date"      `I.p` reset_date_
        , "relayer_address" `I.p` relayer_address_
        ]

instance AT.FromJSON TonWalletGaslessTransfersInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonWalletGaslessTransfersInfo" -> parseTonWalletGaslessTransfersInfo v
      _                               -> mempty
    
    where
      parseTonWalletGaslessTransfersInfo :: A.Value -> AT.Parser TonWalletGaslessTransfersInfo
      parseTonWalletGaslessTransfersInfo = A.withObject "TonWalletGaslessTransfersInfo" $ \o -> do
        left_count_      <- o A..:?  "left_count"
        reset_date_      <- o A..:?  "reset_date"
        relayer_address_ <- o A..:?  "relayer_address"
        pure $ TonWalletGaslessTransfersInfo
          { left_count      = left_count_
          , reset_date      = reset_date_
          , relayer_address = relayer_address_
          }
  parseJSON _ = mempty

