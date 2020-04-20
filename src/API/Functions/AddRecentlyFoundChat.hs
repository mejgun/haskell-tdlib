-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddRecentlyFoundChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data AddRecentlyFoundChat = 
 AddRecentlyFoundChat { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON AddRecentlyFoundChat where
 toJSON (AddRecentlyFoundChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "addRecentlyFoundChat", "chat_id" A..= chat_id ]
-- addRecentlyFoundChat AddRecentlyFoundChat  { chat_id :: Int } 

