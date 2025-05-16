module TD.Data.UpgradedGiftSymbolCount
  (UpgradedGiftSymbolCount(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UpgradedGiftSymbol as UpgradedGiftSymbol

data UpgradedGiftSymbolCount
  = UpgradedGiftSymbolCount -- ^ Describes a symbol shown on the pattern of an upgraded gift
    { symbol      :: Maybe UpgradedGiftSymbol.UpgradedGiftSymbol -- ^ The symbol
    , total_count :: Maybe Int                                   -- ^ Total number of gifts with the symbol
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftSymbolCount where
  shortShow UpgradedGiftSymbolCount
    { symbol      = symbol_
    , total_count = total_count_
    }
      = "UpgradedGiftSymbolCount"
        ++ I.cc
        [ "symbol"      `I.p` symbol_
        , "total_count" `I.p` total_count_
        ]

instance AT.FromJSON UpgradedGiftSymbolCount where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftSymbolCount" -> parseUpgradedGiftSymbolCount v
      _                         -> mempty
    
    where
      parseUpgradedGiftSymbolCount :: A.Value -> AT.Parser UpgradedGiftSymbolCount
      parseUpgradedGiftSymbolCount = A.withObject "UpgradedGiftSymbolCount" $ \o -> do
        symbol_      <- o A..:?  "symbol"
        total_count_ <- o A..:?  "total_count"
        pure $ UpgradedGiftSymbolCount
          { symbol      = symbol_
          , total_count = total_count_
          }
  parseJSON _ = mempty

