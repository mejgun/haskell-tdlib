-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.OpenChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data OpenChat = 
 OpenChat { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON OpenChat where
 toJSON (OpenChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "openChat", "chat_id" A..= chat_id ]
-- openChat OpenChat  { chat_id :: Int } 

