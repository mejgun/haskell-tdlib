-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CloseChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data CloseChat = 
 CloseChat { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON CloseChat where
 toJSON (CloseChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "closeChat", "chat_id" A..= chat_id ]
-- closeChat CloseChat  { chat_id :: Int } 

