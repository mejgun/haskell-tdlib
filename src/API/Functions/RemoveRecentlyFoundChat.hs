-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveRecentlyFoundChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RemoveRecentlyFoundChat = 
 RemoveRecentlyFoundChat { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON RemoveRecentlyFoundChat where
 toJSON (RemoveRecentlyFoundChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "removeRecentlyFoundChat", "chat_id" A..= chat_id ]
-- removeRecentlyFoundChat RemoveRecentlyFoundChat  { chat_id :: Int } 

