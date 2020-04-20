-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPublicMessageLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetPublicMessageLink = 
 GetPublicMessageLink { for_album :: Bool, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetPublicMessageLink where
 toJSON (GetPublicMessageLink { for_album = for_album, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getPublicMessageLink", "for_album" A..= for_album, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- getPublicMessageLink GetPublicMessageLink  { for_album :: Bool, message_id :: Int, chat_id :: Int } 

