-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInlineGameHighScores where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetInlineGameHighScores = 
 GetInlineGameHighScores { user_id :: Maybe Int, inline_message_id :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetInlineGameHighScores where
 toJSON (GetInlineGameHighScores { user_id = user_id, inline_message_id = inline_message_id }) =
  A.object [ "@type" A..= T.String "getInlineGameHighScores", "user_id" A..= user_id, "inline_message_id" A..= inline_message_id ]

instance T.FromJSON GetInlineGameHighScores where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getInlineGameHighScores" -> parseGetInlineGameHighScores v
   _ -> mempty
  where
   parseGetInlineGameHighScores :: A.Value -> T.Parser GetInlineGameHighScores
   parseGetInlineGameHighScores = A.withObject "GetInlineGameHighScores" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    inline_message_id <- o A..:? "inline_message_id"
    return $ GetInlineGameHighScores { user_id = user_id, inline_message_id = inline_message_id }