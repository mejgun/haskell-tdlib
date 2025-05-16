module TD.Data.UpgradedGiftBackdropCount
  (UpgradedGiftBackdropCount(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UpgradedGiftBackdrop as UpgradedGiftBackdrop

data UpgradedGiftBackdropCount
  = UpgradedGiftBackdropCount -- ^ Describes a backdrop of an upgraded gift
    { backdrop    :: Maybe UpgradedGiftBackdrop.UpgradedGiftBackdrop -- ^ The backdrop
    , total_count :: Maybe Int                                       -- ^ Total number of gifts with the symbol
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftBackdropCount where
  shortShow UpgradedGiftBackdropCount
    { backdrop    = backdrop_
    , total_count = total_count_
    }
      = "UpgradedGiftBackdropCount"
        ++ I.cc
        [ "backdrop"    `I.p` backdrop_
        , "total_count" `I.p` total_count_
        ]

instance AT.FromJSON UpgradedGiftBackdropCount where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftBackdropCount" -> parseUpgradedGiftBackdropCount v
      _                           -> mempty
    
    where
      parseUpgradedGiftBackdropCount :: A.Value -> AT.Parser UpgradedGiftBackdropCount
      parseUpgradedGiftBackdropCount = A.withObject "UpgradedGiftBackdropCount" $ \o -> do
        backdrop_    <- o A..:?  "backdrop"
        total_count_ <- o A..:?  "total_count"
        pure $ UpgradedGiftBackdropCount
          { backdrop    = backdrop_
          , total_count = total_count_
          }
  parseJSON _ = mempty

