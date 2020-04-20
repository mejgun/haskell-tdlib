-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Messages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Message as Message

--main = putStrLn "ok"

data Messages = 
 Messages { messages :: [Message.Message], total_count :: Int }  -- deriving (Show)

instance T.ToJSON Messages where
 toJSON (Messages { messages = messages, total_count = total_count }) =
  A.object [ "@type" A..= T.String "messages", "messages" A..= messages, "total_count" A..= total_count ]
-- messages Messages  { messages :: [Message.Message], total_count :: Int } 

