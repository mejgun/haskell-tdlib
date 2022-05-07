{-# LANGUAGE OverloadedStrings #-}

module TD.Data.GameHighScore where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

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
      { score = score,
        user_id = user_id,
        position = position
      } =
      "GameHighScore"
        ++ U.cc
          [ U.p "score" score,
            U.p "user_id" user_id,
            U.p "position" position
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
        score_ <- mconcat [o A..:? "score", U.rm <$> (o A..: "score" :: T.Parser String)] :: T.Parser (Maybe Int)
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        position_ <- mconcat [o A..:? "position", U.rm <$> (o A..: "position" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ GameHighScore {score = score_, user_id = user_id_, position = position_}
  parseJSON _ = mempty

instance T.ToJSON GameHighScore where
  toJSON
    GameHighScore
      { score = score,
        user_id = user_id,
        position = position
      } =
      A.object
        [ "@type" A..= T.String "gameHighScore",
          "score" A..= score,
          "user_id" A..= user_id,
          "position" A..= position
        ]
