{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.GameHighScore where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data GameHighScore = -- | Contains one row of the game high score table @position Position in the high score table @user_id User identifier @score User score
  GameHighScore
  { -- |
    score :: Maybe Int,
    -- |
    user_id :: Maybe Int,
    -- |
    position :: Maybe Int
  }
  deriving (Eq)

instance Show GameHighScore where
  show
    GameHighScore
      { score = score_,
        user_id = user_id_,
        position = position_
      } =
      "GameHighScore"
        ++ U.cc
          [ U.p "score" score_,
            U.p "user_id" user_id_,
            U.p "position" position_
          ]

instance T.FromJSON GameHighScore where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "gameHighScore" -> parseGameHighScore v
      _ -> mempty
    where
      parseGameHighScore :: A.Value -> T.Parser GameHighScore
      parseGameHighScore = A.withObject "GameHighScore" $ \o -> do
        score_ <- o A..:? "score"
        user_id_ <- o A..:? "user_id"
        position_ <- o A..:? "position"
        return $ GameHighScore {score = score_, user_id = user_id_, position = position_}
  parseJSON _ = mempty

instance T.ToJSON GameHighScore where
  toJSON
    GameHighScore
      { score = score_,
        user_id = user_id_,
        position = position_
      } =
      A.object
        [ "@type" A..= T.String "gameHighScore",
          "score" A..= score_,
          "user_id" A..= user_id_,
          "position" A..= position_
        ]
