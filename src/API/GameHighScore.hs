-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GameHighScore where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GameHighScore = 
 GameHighScore { score :: Maybe Int, user_id :: Maybe Int, position :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GameHighScore where
 toJSON (GameHighScore { score = score, user_id = user_id, position = position }) =
  A.object [ "@type" A..= T.String "gameHighScore", "score" A..= score, "user_id" A..= user_id, "position" A..= position ]

instance T.FromJSON GameHighScore where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "gameHighScore" -> parseGameHighScore v
   _ -> mempty
  where
   parseGameHighScore :: A.Value -> T.Parser GameHighScore
   parseGameHighScore = A.withObject "GameHighScore" $ \o -> do
    score <- optional $ o A..: "score"
    user_id <- optional $ o A..: "user_id"
    position <- optional $ o A..: "position"
    return $ GameHighScore { score = score, user_id = user_id, position = position }