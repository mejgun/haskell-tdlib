module TD.Data.TextRange
  (TextRange(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data TextRange
  = TextRange -- ^ Describes a part of a text
    { offset  :: Maybe Int -- ^ Offset of the part, in UTF-16 code units
    , _length :: Maybe Int -- ^ Length of the part, in UTF-16 code units
    }
  deriving (Eq, Show)

instance I.ShortShow TextRange where
  shortShow TextRange
    { offset  = offset_
    , _length = _length_
    }
      = "TextRange"
        ++ I.cc
        [ "offset"  `I.p` offset_
        , "_length" `I.p` _length_
        ]

instance AT.FromJSON TextRange where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "textRange" -> parseTextRange v
      _           -> mempty
    
    where
      parseTextRange :: A.Value -> AT.Parser TextRange
      parseTextRange = A.withObject "TextRange" $ \o -> do
        offset_  <- o A..:?  "offset"
        _length_ <- o A..:?  "length"
        pure $ TextRange
          { offset  = offset_
          , _length = _length_
          }
  parseJSON _ = mempty

