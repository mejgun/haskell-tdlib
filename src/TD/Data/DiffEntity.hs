module TD.Data.DiffEntity
  (DiffEntity(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.DiffEntityType as DiffEntityType

data DiffEntity
  = DiffEntity -- ^ Represents a change of a text
    { offset  :: Maybe Int                           -- ^ Offset of the entity, in UTF-16 code units
    , _length :: Maybe Int                           -- ^ Length of the entity, in UTF-16 code units
    , _type   :: Maybe DiffEntityType.DiffEntityType -- ^ Type of the entity
    }
  deriving (Eq, Show)

instance I.ShortShow DiffEntity where
  shortShow DiffEntity
    { offset  = offset_
    , _length = _length_
    , _type   = _type_
    }
      = "DiffEntity"
        ++ I.cc
        [ "offset"  `I.p` offset_
        , "_length" `I.p` _length_
        , "_type"   `I.p` _type_
        ]

instance AT.FromJSON DiffEntity where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "diffEntity" -> parseDiffEntity v
      _            -> mempty
    
    where
      parseDiffEntity :: A.Value -> AT.Parser DiffEntity
      parseDiffEntity = A.withObject "DiffEntity" $ \o -> do
        offset_  <- o A..:?  "offset"
        _length_ <- o A..:?  "length"
        _type_   <- o A..:?  "type"
        pure $ DiffEntity
          { offset  = offset_
          , _length = _length_
          , _type   = _type_
          }
  parseJSON _ = mempty

