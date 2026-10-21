module TD.Data.UpgradedGiftDepositInfo
  (UpgradedGiftDepositInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified Data.ByteString as BS

data UpgradedGiftDepositInfo
  = UpgradedGiftDepositInfo -- ^ Contains information needed to deposit an upgraded gift from the TON wallet of the current user to a Telegram account. The gift must be transferred by an internal message from the wallet to nft_address with gram_amount attached and with payload as the message body
    { nft_address :: Maybe T.Text        -- ^ Address in TON blockchain to which the message must be sent
    , payload     :: Maybe BS.ByteString -- ^ Body of the NFT transfer message
    , gram_amount :: Maybe Int           -- ^ The amount of TON Grams that must be attached to the message to cover fees, in the smallest units of the cryptocurrency; excess amount will be returned to the wallet
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftDepositInfo where
  shortShow UpgradedGiftDepositInfo
    { nft_address = nft_address_
    , payload     = payload_
    , gram_amount = gram_amount_
    }
      = "UpgradedGiftDepositInfo"
        ++ I.cc
        [ "nft_address" `I.p` nft_address_
        , "payload"     `I.p` payload_
        , "gram_amount" `I.p` gram_amount_
        ]

instance AT.FromJSON UpgradedGiftDepositInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftDepositInfo" -> parseUpgradedGiftDepositInfo v
      _                         -> mempty
    
    where
      parseUpgradedGiftDepositInfo :: A.Value -> AT.Parser UpgradedGiftDepositInfo
      parseUpgradedGiftDepositInfo = A.withObject "UpgradedGiftDepositInfo" $ \o -> do
        nft_address_ <- o A..:?                       "nft_address"
        payload_     <- fmap I.readBytes <$> o A..:?  "payload"
        gram_amount_ <- o A..:?                       "gram_amount"
        pure $ UpgradedGiftDepositInfo
          { nft_address = nft_address_
          , payload     = payload_
          , gram_amount = gram_amount_
          }
  parseJSON _ = mempty

