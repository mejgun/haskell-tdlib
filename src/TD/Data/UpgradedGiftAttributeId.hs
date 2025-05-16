module TD.Data.UpgradedGiftAttributeId
  (UpgradedGiftAttributeId(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Contains identifier of an upgraded gift attribute to search for
data UpgradedGiftAttributeId
  = UpgradedGiftAttributeIdModel -- ^ Identifier of a gift model
    { sticker_id :: Maybe Int -- ^ Identifier of the sticker representing the model
    }
  | UpgradedGiftAttributeIdSymbol -- ^ Identifier of a gift symbol
    { sticker_id :: Maybe Int -- ^ Identifier of the sticker representing the symbol
    }
  | UpgradedGiftAttributeIdBackdrop -- ^ Identifier of a gift backdrop
    { backdrop_id :: Maybe Int -- ^ Identifier of the backdrop
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftAttributeId where
  shortShow UpgradedGiftAttributeIdModel
    { sticker_id = sticker_id_
    }
      = "UpgradedGiftAttributeIdModel"
        ++ I.cc
        [ "sticker_id" `I.p` sticker_id_
        ]
  shortShow UpgradedGiftAttributeIdSymbol
    { sticker_id = sticker_id_
    }
      = "UpgradedGiftAttributeIdSymbol"
        ++ I.cc
        [ "sticker_id" `I.p` sticker_id_
        ]
  shortShow UpgradedGiftAttributeIdBackdrop
    { backdrop_id = backdrop_id_
    }
      = "UpgradedGiftAttributeIdBackdrop"
        ++ I.cc
        [ "backdrop_id" `I.p` backdrop_id_
        ]

instance AT.FromJSON UpgradedGiftAttributeId where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftAttributeIdModel"    -> parseUpgradedGiftAttributeIdModel v
      "upgradedGiftAttributeIdSymbol"   -> parseUpgradedGiftAttributeIdSymbol v
      "upgradedGiftAttributeIdBackdrop" -> parseUpgradedGiftAttributeIdBackdrop v
      _                                 -> mempty
    
    where
      parseUpgradedGiftAttributeIdModel :: A.Value -> AT.Parser UpgradedGiftAttributeId
      parseUpgradedGiftAttributeIdModel = A.withObject "UpgradedGiftAttributeIdModel" $ \o -> do
        sticker_id_ <- fmap I.readInt64 <$> o A..:?  "sticker_id"
        pure $ UpgradedGiftAttributeIdModel
          { sticker_id = sticker_id_
          }
      parseUpgradedGiftAttributeIdSymbol :: A.Value -> AT.Parser UpgradedGiftAttributeId
      parseUpgradedGiftAttributeIdSymbol = A.withObject "UpgradedGiftAttributeIdSymbol" $ \o -> do
        sticker_id_ <- fmap I.readInt64 <$> o A..:?  "sticker_id"
        pure $ UpgradedGiftAttributeIdSymbol
          { sticker_id = sticker_id_
          }
      parseUpgradedGiftAttributeIdBackdrop :: A.Value -> AT.Parser UpgradedGiftAttributeId
      parseUpgradedGiftAttributeIdBackdrop = A.withObject "UpgradedGiftAttributeIdBackdrop" $ \o -> do
        backdrop_id_ <- o A..:?  "backdrop_id"
        pure $ UpgradedGiftAttributeIdBackdrop
          { backdrop_id = backdrop_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON UpgradedGiftAttributeId where
  toJSON UpgradedGiftAttributeIdModel
    { sticker_id = sticker_id_
    }
      = A.object
        [ "@type"      A..= AT.String "upgradedGiftAttributeIdModel"
        , "sticker_id" A..= fmap I.writeInt64  sticker_id_
        ]
  toJSON UpgradedGiftAttributeIdSymbol
    { sticker_id = sticker_id_
    }
      = A.object
        [ "@type"      A..= AT.String "upgradedGiftAttributeIdSymbol"
        , "sticker_id" A..= fmap I.writeInt64  sticker_id_
        ]
  toJSON UpgradedGiftAttributeIdBackdrop
    { backdrop_id = backdrop_id_
    }
      = A.object
        [ "@type"       A..= AT.String "upgradedGiftAttributeIdBackdrop"
        , "backdrop_id" A..= backdrop_id_
        ]

