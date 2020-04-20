-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GameHighScores where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.GameHighScore as GameHighScore

--main = putStrLn "ok"

data GameHighScores = 
 GameHighScores { scores :: [GameHighScore.GameHighScore] }  -- deriving (Show)

instance T.ToJSON GameHighScores where
 toJSON (GameHighScores { scores = scores }) =
  A.object [ "@type" A..= T.String "gameHighScores", "scores" A..= scores ]
-- gameHighScores GameHighScores  { scores :: [GameHighScore.GameHighScore] } 

