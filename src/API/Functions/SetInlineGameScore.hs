-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetInlineGameScore where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Updates the game score of the specified user in a game; for bots only 
-- 
-- __inline_message_id__ Inline message identifier
-- 
-- __edit_message__ Pass true to edit the game message to include the current scoreboard
-- 
-- __user_id__ User identifier
-- 
-- __score__ The new score
-- 
-- __force__ Pass true to update the score even if it decreases. If the score is 0, the user will be deleted from the high score table
data SetInlineGameScore = 

 SetInlineGameScore { force :: Maybe Bool, score :: Maybe Int, user_id :: Maybe Int, edit_message :: Maybe Bool, inline_message_id :: Maybe String }  deriving (Eq)

instance Show SetInlineGameScore where
 show SetInlineGameScore { force=force, score=score, user_id=user_id, edit_message=edit_message, inline_message_id=inline_message_id } =
  "SetInlineGameScore" ++ U.cc [U.p "force" force, U.p "score" score, U.p "user_id" user_id, U.p "edit_message" edit_message, U.p "inline_message_id" inline_message_id ]

instance T.ToJSON SetInlineGameScore where
 toJSON SetInlineGameScore { force = force, score = score, user_id = user_id, edit_message = edit_message, inline_message_id = inline_message_id } =
  A.object [ "@type" A..= T.String "setInlineGameScore", "force" A..= force, "score" A..= score, "user_id" A..= user_id, "edit_message" A..= edit_message, "inline_message_id" A..= inline_message_id ]

instance T.FromJSON SetInlineGameScore where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setInlineGameScore" -> parseSetInlineGameScore v
   _ -> mempty
  where
   parseSetInlineGameScore :: A.Value -> T.Parser SetInlineGameScore
   parseSetInlineGameScore = A.withObject "SetInlineGameScore" $ \o -> do
    force <- o A..:? "force"
    score <- mconcat [ o A..:? "score", readMaybe <$> (o A..: "score" :: T.Parser String)] :: T.Parser (Maybe Int)
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    edit_message <- o A..:? "edit_message"
    inline_message_id <- o A..:? "inline_message_id"
    return $ SetInlineGameScore { force = force, score = score, user_id = user_id, edit_message = edit_message, inline_message_id = inline_message_id }
 parseJSON _ = mempty
