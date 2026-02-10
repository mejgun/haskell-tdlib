module TD.Data.UpgradedGiftSymbol
  (UpgradedGiftSymbol(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.UpgradedGiftAttributeRarity as UpgradedGiftAttributeRarity

data UpgradedGiftSymbol
  = UpgradedGiftSymbol -- ^ Describes a symbol shown on the pattern of an upgraded gift
    { name    :: Maybe T.Text                                                  -- ^ Name of the symbol
    , sticker :: Maybe Sticker.Sticker                                         -- ^ The sticker representing the symbol
    , rarity  :: Maybe UpgradedGiftAttributeRarity.UpgradedGiftAttributeRarity -- ^ The rarity of the symbol
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftSymbol where
  shortShow UpgradedGiftSymbol
    { name    = name_
    , sticker = sticker_
    , rarity  = rarity_
    }
      = "UpgradedGiftSymbol"
        ++ I.cc
        [ "name"    `I.p` name_
        , "sticker" `I.p` sticker_
        , "rarity"  `I.p` rarity_
        ]

instance AT.FromJSON UpgradedGiftSymbol where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftSymbol" -> parseUpgradedGiftSymbol v
      _                    -> mempty
    
    where
      parseUpgradedGiftSymbol :: A.Value -> AT.Parser UpgradedGiftSymbol
      parseUpgradedGiftSymbol = A.withObject "UpgradedGiftSymbol" $ \o -> do
        name_    <- o A..:?  "name"
        sticker_ <- o A..:?  "sticker"
        rarity_  <- o A..:?  "rarity"
        pure $ UpgradedGiftSymbol
          { name    = name_
          , sticker = sticker_
          , rarity  = rarity_
          }
  parseJSON _ = mempty

