-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ForwardMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SendMessageOptions as SendMessageOptions

--main = putStrLn "ok"

data ForwardMessages = 
 ForwardMessages { remove_caption :: Bool, send_copy :: Bool, as_album :: Bool, options :: SendMessageOptions.SendMessageOptions, message_ids :: [Int], from_chat_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON ForwardMessages where
 toJSON (ForwardMessages { remove_caption = remove_caption, send_copy = send_copy, as_album = as_album, options = options, message_ids = message_ids, from_chat_id = from_chat_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "forwardMessages", "remove_caption" A..= remove_caption, "send_copy" A..= send_copy, "as_album" A..= as_album, "options" A..= options, "message_ids" A..= message_ids, "from_chat_id" A..= from_chat_id, "chat_id" A..= chat_id ]
-- forwardMessages ForwardMessages  { remove_caption :: Bool, send_copy :: Bool, as_album :: Bool, options :: SendMessageOptions.SendMessageOptions, message_ids :: [Int], from_chat_id :: Int, chat_id :: Int } 

