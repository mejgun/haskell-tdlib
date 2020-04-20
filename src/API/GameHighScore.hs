-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GameHighScore where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GameHighScore = 
 GameHighScore { score :: Int, user_id :: Int, position :: Int }  -- deriving (Show)

instance T.ToJSON GameHighScore where
 toJSON (GameHighScore { score = score, user_id = user_id, position = position }) =
  A.object [ "@type" A..= T.String "gameHighScore", "score" A..= score, "user_id" A..= user_id, "position" A..= position ]
-- gameHighScore GameHighScore  { score :: Int, user_id :: Int, position :: Int } 

