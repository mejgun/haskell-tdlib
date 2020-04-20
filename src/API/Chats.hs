-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Chats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Chats = 
 Chats { chat_ids :: [Int] }  -- deriving (Show)

instance T.ToJSON Chats where
 toJSON (Chats { chat_ids = chat_ids }) =
  A.object [ "@type" A..= T.String "chats", "chat_ids" A..= chat_ids ]
-- chats Chats  { chat_ids :: [Int] } 

