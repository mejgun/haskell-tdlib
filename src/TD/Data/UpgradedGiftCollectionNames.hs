module TD.Data.UpgradedGiftCollectionNames
  (UpgradedGiftCollectionNames(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data UpgradedGiftCollectionNames
  = UpgradedGiftCollectionNames -- ^ Contains a list of names of upgraded gift collections. The name of the collection of an upgraded gift is the part of upgradedGift.name before the last "-"
    { names :: Maybe [T.Text] -- ^ The names
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftCollectionNames where
  shortShow UpgradedGiftCollectionNames
    { names = names_
    }
      = "UpgradedGiftCollectionNames"
        ++ I.cc
        [ "names" `I.p` names_
        ]

instance AT.FromJSON UpgradedGiftCollectionNames where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftCollectionNames" -> parseUpgradedGiftCollectionNames v
      _                             -> mempty
    
    where
      parseUpgradedGiftCollectionNames :: A.Value -> AT.Parser UpgradedGiftCollectionNames
      parseUpgradedGiftCollectionNames = A.withObject "UpgradedGiftCollectionNames" $ \o -> do
        names_ <- o A..:?  "names"
        pure $ UpgradedGiftCollectionNames
          { names = names_
          }
  parseJSON _ = mempty

