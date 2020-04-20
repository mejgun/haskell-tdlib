-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetChat = 
 GetChat { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetChat where
 toJSON (GetChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getChat", "chat_id" A..= chat_id ]
-- getChat GetChat  { chat_id :: Int } 

