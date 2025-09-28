module TD.Data.GiftCollections
  (GiftCollections(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GiftCollection as GiftCollection

data GiftCollections
  = GiftCollections -- ^ Contains a list of gift collections
    { collections :: Maybe [GiftCollection.GiftCollection] -- ^ List of gift collections
    }
  deriving (Eq, Show)

instance I.ShortShow GiftCollections where
  shortShow GiftCollections
    { collections = collections_
    }
      = "GiftCollections"
        ++ I.cc
        [ "collections" `I.p` collections_
        ]

instance AT.FromJSON GiftCollections where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftCollections" -> parseGiftCollections v
      _                 -> mempty
    
    where
      parseGiftCollections :: A.Value -> AT.Parser GiftCollections
      parseGiftCollections = A.withObject "GiftCollections" $ \o -> do
        collections_ <- o A..:?  "collections"
        pure $ GiftCollections
          { collections = collections_
          }
  parseJSON _ = mempty

