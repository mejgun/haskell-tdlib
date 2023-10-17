module TD.Data.GameHighScores
  (GameHighScores(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GameHighScore as GameHighScore

data GameHighScores
  = GameHighScores -- ^ Contains a list of game high scores
    { scores :: Maybe [GameHighScore.GameHighScore] -- ^ A list of game high scores
    }
  deriving (Eq, Show)

instance I.ShortShow GameHighScores where
  shortShow GameHighScores
    { scores = scores_
    }
      = "GameHighScores"
        ++ I.cc
        [ "scores" `I.p` scores_
        ]

instance AT.FromJSON GameHighScores where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "gameHighScores" -> parseGameHighScores v
      _                -> mempty
    
    where
      parseGameHighScores :: A.Value -> AT.Parser GameHighScores
      parseGameHighScores = A.withObject "GameHighScores" $ \o -> do
        scores_ <- o A..:?  "scores"
        pure $ GameHighScores
          { scores = scores_
          }
  parseJSON _ = mempty

