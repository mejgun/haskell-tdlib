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



instance T.FromJSON FoundMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "foundMessages" -> parseFoundMessages v
  where
   parseFoundMessages :: A.Value -> T.Parser FoundMessages
   parseFoundMessages = A.withObject "FoundMessages" $ \o -> do
    next_from_search_id <- o A..: "next_from_search_id"
    messages <- o A..: "messages"
    return $ FoundMessages { next_from_search_id = next_from_search_id, messages = messages }