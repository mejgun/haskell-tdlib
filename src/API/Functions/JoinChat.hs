-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.JoinChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data JoinChat = 
 JoinChat { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON JoinChat where
 toJSON (JoinChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "joinChat", "chat_id" A..= chat_id ]
-- joinChat JoinChat  { chat_id :: Int } 

