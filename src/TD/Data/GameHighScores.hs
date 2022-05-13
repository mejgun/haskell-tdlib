{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.GameHighScores where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.GameHighScore as GameHighScore
import qualified Utils as U

data GameHighScores = -- | Contains a list of game high scores @scores A list of game high scores
  GameHighScores
  { -- |
    scores :: Maybe [GameHighScore.GameHighScore]
  }
  deriving (Eq)

instance Show GameHighScores where
  show
    GameHighScores
      { scores = scores_
      } =
      "GameHighScores"
        ++ U.cc
          [ U.p "scores" scores_
          ]

instance T.FromJSON GameHighScores where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "gameHighScores" -> parseGameHighScores v
      _ -> mempty
    where
      parseGameHighScores :: A.Value -> T.Parser GameHighScores
      parseGameHighScores = A.withObject "GameHighScores" $ \o -> do
        scores_ <- o A..:? "scores"
        return $ GameHighScores {scores = scores_}
  parseJSON _ = mempty

instance T.ToJSON GameHighScores where
  toJSON
    GameHighScores
      { scores = scores_
      } =
      A.object
        [ "@type" A..= T.String "gameHighScores",
          "scores" A..= scores_
        ]
