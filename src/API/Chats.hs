-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Chats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Chats = 
 Chats { chat_ids :: [Int] }  deriving (Show)

instance T.ToJSON Chats where
 toJSON (Chats { chat_ids = chat_ids }) =
  A.object [ "@type" A..= T.String "chats", "chat_ids" A..= chat_ids ]



instance T.FromJSON Chats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chats" -> parseChats v

   _ -> mempty ""
  where
   parseChats :: A.Value -> T.Parser Chats
   parseChats = A.withObject "Chats" $ \o -> do
    chat_ids <- o A..: "chat_ids"
    return $ Chats { chat_ids = chat_ids }