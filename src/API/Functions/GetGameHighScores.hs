-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetGameHighScores where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns the high scores for a game and some part of the high score table in the range of the specified user; for bots only 
-- 
-- __chat_id__ The chat that contains the message with the game
-- 
-- __message_id__ Identifier of the message
-- 
-- __user_id__ User identifier
data GetGameHighScores = 

 GetGameHighScores { user_id :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetGameHighScores where
 show GetGameHighScores { user_id=user_id, message_id=message_id, chat_id=chat_id } =
  "GetGameHighScores" ++ cc [p "user_id" user_id, p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetGameHighScores where
 toJSON GetGameHighScores { user_id = user_id, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getGameHighScores", "user_id" A..= user_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetGameHighScores where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getGameHighScores" -> parseGetGameHighScores v
   _ -> mempty
  where
   parseGetGameHighScores :: A.Value -> T.Parser GetGameHighScores
   parseGetGameHighScores = A.withObject "GetGameHighScores" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetGameHighScores { user_id = user_id, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
