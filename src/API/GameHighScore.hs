-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GameHighScore where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GameHighScore = 
 GameHighScore { score :: Int, user_id :: Int, position :: Int }  deriving (Show)

instance T.ToJSON GameHighScore where
 toJSON (GameHighScore { score = score, user_id = user_id, position = position }) =
  A.object [ "@type" A..= T.String "gameHighScore", "score" A..= score, "user_id" A..= user_id, "position" A..= position ]



instance T.FromJSON GameHighScore where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "gameHighScore" -> parseGameHighScore v

   _ -> mempty ""
  where
   parseGameHighScore :: A.Value -> T.Parser GameHighScore
   parseGameHighScore = A.withObject "GameHighScore" $ \o -> do
    score <- o A..: "score"
    user_id <- o A..: "user_id"
    position <- o A..: "position"
    return $ GameHighScore { score = score, user_id = user_id, position = position }