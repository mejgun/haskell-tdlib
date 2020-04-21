-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GameHighScores where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.GameHighScore as GameHighScore

data GameHighScores = 
 GameHighScores { scores :: [GameHighScore.GameHighScore] }  deriving (Show)

instance T.ToJSON GameHighScores where
 toJSON (GameHighScores { scores = scores }) =
  A.object [ "@type" A..= T.String "gameHighScores", "scores" A..= scores ]

instance T.FromJSON GameHighScores where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "gameHighScores" -> parseGameHighScores v
   _ -> mempty
  where
   parseGameHighScores :: A.Value -> T.Parser GameHighScores
   parseGameHighScores = A.withObject "GameHighScores" $ \o -> do
    scores <- o A..: "scores"
    return $ GameHighScores { scores = scores }