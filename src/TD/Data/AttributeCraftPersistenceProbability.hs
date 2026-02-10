module TD.Data.AttributeCraftPersistenceProbability
  (AttributeCraftPersistenceProbability(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data AttributeCraftPersistenceProbability
  = AttributeCraftPersistenceProbability -- ^ Describes chance of the crafted gift to have the backdrop or symbol of one of the original gifts
    { persistence_chance_per_mille :: Maybe [Int] -- ^ The 4 numbers that describe probability of the craft result to have the same attribute as one of the original gifts if 1, 2, 3, or 4 gifts with the attribute are used in the craft. Each number represents the number of crafted gifts with the original attribute per 1000 successful craftings
    }
  deriving (Eq, Show)

instance I.ShortShow AttributeCraftPersistenceProbability where
  shortShow AttributeCraftPersistenceProbability
    { persistence_chance_per_mille = persistence_chance_per_mille_
    }
      = "AttributeCraftPersistenceProbability"
        ++ I.cc
        [ "persistence_chance_per_mille" `I.p` persistence_chance_per_mille_
        ]

instance AT.FromJSON AttributeCraftPersistenceProbability where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "attributeCraftPersistenceProbability" -> parseAttributeCraftPersistenceProbability v
      _                                      -> mempty
    
    where
      parseAttributeCraftPersistenceProbability :: A.Value -> AT.Parser AttributeCraftPersistenceProbability
      parseAttributeCraftPersistenceProbability = A.withObject "AttributeCraftPersistenceProbability" $ \o -> do
        persistence_chance_per_mille_ <- o A..:?  "persistence_chance_per_mille"
        pure $ AttributeCraftPersistenceProbability
          { persistence_chance_per_mille = persistence_chance_per_mille_
          }
  parseJSON _ = mempty

