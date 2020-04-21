-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteMessages = 
 DeleteMessages { revoke :: Bool, message_ids :: [Int], chat_id :: Int }  deriving (Show)

instance T.ToJSON DeleteMessages where
 toJSON (DeleteMessages { revoke = revoke, message_ids = message_ids, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "deleteMessages", "revoke" A..= revoke, "message_ids" A..= message_ids, "chat_id" A..= chat_id ]



instance T.FromJSON DeleteMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteMessages" -> parseDeleteMessages v

   _ -> mempty ""
  where
   parseDeleteMessages :: A.Value -> T.Parser DeleteMessages
   parseDeleteMessages = A.withObject "DeleteMessages" $ \o -> do
    revoke <- o A..: "revoke"
    message_ids <- o A..: "message_ids"
    chat_id <- o A..: "chat_id"
    return $ DeleteMessages { revoke = revoke, message_ids = message_ids, chat_id = chat_id }