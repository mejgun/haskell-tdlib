-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatDescription where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetChatDescription = 
 SetChatDescription { description :: String, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatDescription where
 toJSON (SetChatDescription { description = description, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatDescription", "description" A..= description, "chat_id" A..= chat_id ]
-- setChatDescription SetChatDescription  { description :: String, chat_id :: Int } 



instance T.FromJSON SetChatDescription where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatDescription" -> parseSetChatDescription v
  where
   parseSetChatDescription :: A.Value -> T.Parser SetChatDescription
   parseSetChatDescription = A.withObject "SetChatDescription" $ \o -> do
    description <- o A..: "description"
    chat_id <- o A..: "chat_id"
    return $ SetChatDescription { description = description, chat_id = chat_id }