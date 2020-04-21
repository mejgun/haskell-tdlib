-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetMessages = 
 GetMessages { message_ids :: [Int], chat_id :: Int }  deriving (Show)

instance T.ToJSON GetMessages where
 toJSON (GetMessages { message_ids = message_ids, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getMessages", "message_ids" A..= message_ids, "chat_id" A..= chat_id ]



instance T.FromJSON GetMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMessages" -> parseGetMessages v

   _ -> mempty ""
  where
   parseGetMessages :: A.Value -> T.Parser GetMessages
   parseGetMessages = A.withObject "GetMessages" $ \o -> do
    message_ids <- o A..: "message_ids"
    chat_id <- o A..: "chat_id"
    return $ GetMessages { message_ids = message_ids, chat_id = chat_id }