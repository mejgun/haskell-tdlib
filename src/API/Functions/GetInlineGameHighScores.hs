-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetInlineGameHighScores where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetInlineGameHighScores = 
 GetInlineGameHighScores { user_id :: Maybe Int, inline_message_id :: Maybe String }  deriving (Show)

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
    user_id <- optional $ o A..: "user_id"
    inline_message_id <- optional $ o A..: "inline_message_id"
    return $ GetInlineGameHighScores { user_id = user_id, inline_message_id = inline_message_id }