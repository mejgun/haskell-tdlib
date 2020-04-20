-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatTitle where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetChatTitle = 
 SetChatTitle { title :: String, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SetChatTitle where
 toJSON (SetChatTitle { title = title, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "setChatTitle", "title" A..= title, "chat_id" A..= chat_id ]
-- setChatTitle SetChatTitle  { title :: String, chat_id :: Int } 



instance T.FromJSON SetChatTitle where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatTitle" -> parseSetChatTitle v
  where
   parseSetChatTitle :: A.Value -> T.Parser SetChatTitle
   parseSetChatTitle = A.withObject "SetChatTitle" $ \o -> do
    title <- o A..: "title"
    chat_id <- o A..: "chat_id"
    return $ SetChatTitle { title = title, chat_id = chat_id }