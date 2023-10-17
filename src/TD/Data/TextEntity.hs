module TD.Data.TextEntity
  ( TextEntity(..)    
  , defaultTextEntity 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TextEntityType as TextEntityType

data TextEntity
  = TextEntity -- ^ Represents a part of the text that needs to be formatted in some unusual way
    { offset  :: Maybe Int                           -- ^ Offset of the entity, in UTF-16 code units
    , _length :: Maybe Int                           -- ^ Length of the entity, in UTF-16 code units
    , _type   :: Maybe TextEntityType.TextEntityType -- ^ Type of the entity
    }
  deriving (Eq, Show)

instance I.ShortShow TextEntity where
  shortShow TextEntity
    { offset  = offset_
    , _length = _length_
    , _type   = _type_
    }
      = "TextEntity"
        ++ I.cc
        [ "offset"  `I.p` offset_
        , "_length" `I.p` _length_
        , "_type"   `I.p` _type_
        ]

instance AT.FromJSON TextEntity where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "textEntity" -> parseTextEntity v
      _            -> mempty
    
    where
      parseTextEntity :: A.Value -> AT.Parser TextEntity
      parseTextEntity = A.withObject "TextEntity" $ \o -> do
        offset_  <- o A..:?  "offset"
        _length_ <- o A..:?  "length"
        _type_   <- o A..:?  "type"
        pure $ TextEntity
          { offset  = offset_
          , _length = _length_
          , _type   = _type_
          }
  parseJSON _ = mempty

instance AT.ToJSON TextEntity where
  toJSON TextEntity
    { offset  = offset_
    , _length = _length_
    , _type   = _type_
    }
      = A.object
        [ "@type"  A..= AT.String "textEntity"
        , "offset" A..= offset_
        , "length" A..= _length_
        , "type"   A..= _type_
        ]

defaultTextEntity :: TextEntity
defaultTextEntity =
  TextEntity
    { offset  = Nothing
    , _length = Nothing
    , _type   = Nothing
    }

