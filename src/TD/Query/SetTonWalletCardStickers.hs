module TD.Query.SetTonWalletCardStickers
  (SetTonWalletCardStickers(..)
  , defaultSetTonWalletCardStickers
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputTonWalletCardSticker as InputTonWalletCardSticker
import qualified Data.Text as T

-- | Changes the list of stickers on the TON wallet card of the current user; can be used only if getOption("can_use_ton_wallet"). The whole list of stickers is replaced. The request can take up to 20 seconds to complete, so it must be called only on explicit user action. Stickers are removed automatically if the corresponding NFT leaves the wallet or the wallet is replaced. Returns the updated card. Returns 'TD.Data.TonWalletCard.TonWalletCard'
data SetTonWalletCardStickers
  = SetTonWalletCardStickers
    { stickers               :: Maybe [InputTonWalletCardSticker.InputTonWalletCardSticker] -- ^ The new list of stickers; pass an empty list to remove all stickers. Up to 10 stickers can be added. Each NFT can be used only once
    , background_nft_address :: Maybe T.Text                                                -- ^ Address of the NFT from the new list of stickers, whose colors will be used for the card background; pass an empty string to use the default background. The NFT must correspond to an upgraded gift with can_be_ton_wallet_card_background == true
    }
  deriving (Eq, Show)

instance I.ShortShow SetTonWalletCardStickers where
  shortShow
    SetTonWalletCardStickers
      { stickers               = stickers_
      , background_nft_address = background_nft_address_
      }
        = "SetTonWalletCardStickers"
          ++ I.cc
          [ "stickers"               `I.p` stickers_
          , "background_nft_address" `I.p` background_nft_address_
          ]

instance AT.ToJSON SetTonWalletCardStickers where
  toJSON
    SetTonWalletCardStickers
      { stickers               = stickers_
      , background_nft_address = background_nft_address_
      }
        = A.object
          [ "@type"                  A..= AT.String "setTonWalletCardStickers"
          , "stickers"               A..= stickers_
          , "background_nft_address" A..= background_nft_address_
          ]

defaultSetTonWalletCardStickers :: SetTonWalletCardStickers
defaultSetTonWalletCardStickers =
  SetTonWalletCardStickers
    { stickers               = Nothing
    , background_nft_address = Nothing
    }

