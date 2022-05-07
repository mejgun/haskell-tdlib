{-# LANGUAGE OverloadedStrings #-}

module TD.Data.TextEntities where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.TextEntity as TextEntity
import qualified Utils as U

data TextEntities = -- | Contains a list of text entities @entities List of text entities
  TextEntities
  { -- |
    entities :: Maybe [TextEntity.TextEntity]
  }
  deriving (Eq)

instance Show TextEntities where
  show
    TextEntities
      { entities = entities
      } =
      "TextEntities"
        ++ U.cc
          [ U.p "entities" entities
          ]

instance T.FromJSON TextEntities where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "textEntities" -> parseTextEntities v
      _ -> mempty
    where
      parseTextEntities :: A.Value -> T.Parser TextEntities
      parseTextEntities = A.withObject "TextEntities" $ \o -> do
        entities_ <- o A..:? "entities"
        return $ TextEntities {entities = entities_}
  parseJSON _ = mempty

instance T.ToJSON TextEntities where
  toJSON
    TextEntities
      { entities = entities
      } =
      A.object
        [ "@type" A..= T.String "textEntities",
          "entities" A..= entities
        ]
