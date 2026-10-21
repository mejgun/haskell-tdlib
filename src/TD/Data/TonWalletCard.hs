module TD.Data.TonWalletCard
  (TonWalletCard(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.TonWalletCardSticker as TonWalletCardSticker

data TonWalletCard
  = TonWalletCard -- ^ Describes a TON wallet card, which is shown on the profile page of a user to everyone
    { address                :: Maybe T.Text                                      -- ^ Address of the wallet
    , gram_amount            :: Maybe Int                                         -- ^ Balance of the wallet, in the smallest units of the cryptocurrency; may be slightly outdated
    , stickers               :: Maybe [TonWalletCardSticker.TonWalletCardSticker] -- ^ Stickers placed on the card
    , background_nft_address :: Maybe T.Text                                      -- ^ Address of the NFT of one of the stickers, whose colors must be used for the card background; may be empty if the default background must be used
    }
  deriving (Eq, Show)

instance I.ShortShow TonWalletCard where
  shortShow TonWalletCard
    { address                = address_
    , gram_amount            = gram_amount_
    , stickers               = stickers_
    , background_nft_address = background_nft_address_
    }
      = "TonWalletCard"
        ++ I.cc
        [ "address"                `I.p` address_
        , "gram_amount"            `I.p` gram_amount_
        , "stickers"               `I.p` stickers_
        , "background_nft_address" `I.p` background_nft_address_
        ]

instance AT.FromJSON TonWalletCard where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonWalletCard" -> parseTonWalletCard v
      _               -> mempty
    
    where
      parseTonWalletCard :: A.Value -> AT.Parser TonWalletCard
      parseTonWalletCard = A.withObject "TonWalletCard" $ \o -> do
        address_                <- o A..:?  "address"
        gram_amount_            <- o A..:?  "gram_amount"
        stickers_               <- o A..:?  "stickers"
        background_nft_address_ <- o A..:?  "background_nft_address"
        pure $ TonWalletCard
          { address                = address_
          , gram_amount            = gram_amount_
          , stickers               = stickers_
          , background_nft_address = background_nft_address_
          }
  parseJSON _ = mempty

