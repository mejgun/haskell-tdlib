module TD.Data.TonWalletCardSticker
  (TonWalletCardSticker(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AreaPosition as AreaPosition
import qualified TD.Data.TonNft as TonNft

data TonWalletCardSticker
  = TonWalletCardSticker -- ^ Describes a sticker on a TON wallet card
    { position :: Maybe AreaPosition.AreaPosition -- ^ Position of the sticker on the card
    , nft      :: Maybe TonNft.TonNft             -- ^ The NFT shown as the sticker. If nft.gift is non-null, then it is enough to draw the sticker and there is no need to download the media of the NFT
    }
  deriving (Eq, Show)

instance I.ShortShow TonWalletCardSticker where
  shortShow TonWalletCardSticker
    { position = position_
    , nft      = nft_
    }
      = "TonWalletCardSticker"
        ++ I.cc
        [ "position" `I.p` position_
        , "nft"      `I.p` nft_
        ]

instance AT.FromJSON TonWalletCardSticker where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonWalletCardSticker" -> parseTonWalletCardSticker v
      _                      -> mempty
    
    where
      parseTonWalletCardSticker :: A.Value -> AT.Parser TonWalletCardSticker
      parseTonWalletCardSticker = A.withObject "TonWalletCardSticker" $ \o -> do
        position_ <- o A..:?  "position"
        nft_      <- o A..:?  "nft"
        pure $ TonWalletCardSticker
          { position = position_
          , nft      = nft_
          }
  parseJSON _ = mempty

