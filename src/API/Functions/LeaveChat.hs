-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.LeaveChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data LeaveChat = 
 LeaveChat { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON LeaveChat where
 toJSON (LeaveChat { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "leaveChat", "chat_id" A..= chat_id ]
-- leaveChat LeaveChat  { chat_id :: Int } 

