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

