-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetPinnedChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatList as ChatList

--main = putStrLn "ok"

data SetPinnedChats = 
 SetPinnedChats { chat_ids :: [Int], chat_list :: ChatList.ChatList }  -- deriving (Show)

instance T.ToJSON SetPinnedChats where
 toJSON (SetPinnedChats { chat_ids = chat_ids, chat_list = chat_list }) =
  A.object [ "@type" A..= T.String "setPinnedChats", "chat_ids" A..= chat_ids, "chat_list" A..= chat_list ]
-- setPinnedChats SetPinnedChats  { chat_ids :: [Int], chat_list :: ChatList.ChatList } 



instance T.FromJSON SetPinnedChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setPinnedChats" -> parseSetPinnedChats v
  where
   parseSetPinnedChats :: A.Value -> T.Parser SetPinnedChats
   parseSetPinnedChats = A.withObject "SetPinnedChats" $ \o -> do
    chat_ids <- o A..: "chat_ids"
    chat_list <- o A..: "chat_list"
    return $ SetPinnedChats { chat_ids = chat_ids, chat_list = chat_list }