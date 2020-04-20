-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.FoundMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Message as Message

--main = putStrLn "ok"

data FoundMessages = 
 FoundMessages { next_from_search_id :: Int, messages :: [Message.Message] }  -- deriving (Show)

instance T.ToJSON FoundMessages where
 toJSON (FoundMessages { next_from_search_id = next_from_search_id, messages = messages }) =
  A.object [ "@type" A..= T.String "foundMessages", "next_from_search_id" A..= next_from_search_id, "messages" A..= messages ]
-- foundMessages FoundMessages  { next_from_search_id :: Int, messages :: [Message.Message] } 

