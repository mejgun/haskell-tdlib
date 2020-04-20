-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetInlineGameScore where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetInlineGameScore = 
 SetInlineGameScore { force :: Bool, score :: Int, user_id :: Int, edit_message :: Bool, inline_message_id :: String }  -- deriving (Show)

instance T.ToJSON SetInlineGameScore where
 toJSON (SetInlineGameScore { force = force, score = score, user_id = user_id, edit_message = edit_message, inline_message_id = inline_message_id }) =
  A.object [ "@type" A..= T.String "setInlineGameScore", "force" A..= force, "score" A..= score, "user_id" A..= user_id, "edit_message" A..= edit_message, "inline_message_id" A..= inline_message_id ]
-- setInlineGameScore SetInlineGameScore  { force :: Bool, score :: Int, user_id :: Int, edit_message :: Bool, inline_message_id :: String } 



instance T.FromJSON SetInlineGameScore where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setInlineGameScore" -> parseSetInlineGameScore v
  where
   parseSetInlineGameScore :: A.Value -> T.Parser SetInlineGameScore
   parseSetInlineGameScore = A.withObject "SetInlineGameScore" $ \o -> do
    force <- o A..: "force"
    score <- o A..: "score"
    user_id <- o A..: "user_id"
    edit_message <- o A..: "edit_message"
    inline_message_id <- o A..: "inline_message_id"
    return $ SetInlineGameScore { force = force, score = score, user_id = user_id, edit_message = edit_message, inline_message_id = inline_message_id }