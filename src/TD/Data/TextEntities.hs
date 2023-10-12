module TD.Data.TextEntities where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.TextEntity as TextEntity

data TextEntities
  = TextEntities -- ^ Contains a list of text entities
    { entities :: Maybe [TextEntity.TextEntity] -- ^ List of text entities
    }
  deriving (Eq)

instance Show TextEntities where
  show TextEntities
    { entities = entities_
    }
      = "TextEntities"
        ++ I.cc
        [ "entities" `I.p` entities_
        ]

instance AT.FromJSON TextEntities where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "textEntities" -> parseTextEntities v
      _              -> mempty
    
    where
      parseTextEntities :: A.Value -> AT.Parser TextEntities
      parseTextEntities = A.withObject "TextEntities" $ \o -> do
        entities_ <- o A..:?  "entities"
        pure $ TextEntities
          { entities = entities_
          }

instance AT.ToJSON TextEntities where
  toJSON TextEntities
    { entities = entities_
    }
      = A.object
        [ "@type"    A..= AT.String "textEntities"
        , "entities" A..= entities_
        ]
