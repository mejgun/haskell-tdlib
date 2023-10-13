module TD.Data.TextEntities
  ( TextEntities(..)    
  , defaultTextEntities 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
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
  parseJSON _ = mempty

instance AT.ToJSON TextEntities where
  toJSON TextEntities
    { entities = entities_
    }
      = A.object
        [ "@type"    A..= AT.String "textEntities"
        , "entities" A..= entities_
        ]

defaultTextEntities :: TextEntities
defaultTextEntities =
  TextEntities
    { entities = Nothing
    }

