module TD.Query.GetTonWalletCardBackgroundGiftCollectionNames
  (GetTonWalletCardBackgroundGiftCollectionNames(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns names of upgraded gift collections whose NFTs can be used as background_nft_address in setTonWalletCardStickers; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.UpgradedGiftCollectionNames.UpgradedGiftCollectionNames'
data GetTonWalletCardBackgroundGiftCollectionNames
  = GetTonWalletCardBackgroundGiftCollectionNames
  deriving (Eq, Show)

instance I.ShortShow GetTonWalletCardBackgroundGiftCollectionNames where
  shortShow
    GetTonWalletCardBackgroundGiftCollectionNames
        = "GetTonWalletCardBackgroundGiftCollectionNames"

instance AT.ToJSON GetTonWalletCardBackgroundGiftCollectionNames where
  toJSON
    GetTonWalletCardBackgroundGiftCollectionNames
        = A.object
          [ "@type" A..= AT.String "getTonWalletCardBackgroundGiftCollectionNames"
          ]

