-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GameHighScores where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.GameHighScore as GameHighScore

-- |
-- 
-- Contains a list of game high scores 
-- 
-- __scores__ A list of game high scores
data GameHighScores = 

 GameHighScores { scores :: Maybe [GameHighScore.GameHighScore] }  deriving (Eq)

instance Show GameHighScores where
 show GameHighScores { scores=scores } =
  "GameHighScores" ++ cc [p "scores" scores ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GameHighScores where
 toJSON GameHighScores { scores = scores } =
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
    scores <- o A..:? "scores"
    return $ GameHighScores { scores = scores }
 parseJSON _ = mempty
