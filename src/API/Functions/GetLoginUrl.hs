-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetLoginUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetLoginUrl = 
 GetLoginUrl { allow_write_access :: Bool, button_id :: Int, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetLoginUrl where
 toJSON (GetLoginUrl { allow_write_access = allow_write_access, button_id = button_id, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getLoginUrl", "allow_write_access" A..= allow_write_access, "button_id" A..= button_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- getLoginUrl GetLoginUrl  { allow_write_access :: Bool, button_id :: Int, message_id :: Int, chat_id :: Int } 



instance T.FromJSON GetLoginUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getLoginUrl" -> parseGetLoginUrl v
  where
   parseGetLoginUrl :: A.Value -> T.Parser GetLoginUrl
   parseGetLoginUrl = A.withObject "GetLoginUrl" $ \o -> do
    allow_write_access <- o A..: "allow_write_access"
    button_id <- o A..: "button_id"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ GetLoginUrl { allow_write_access = allow_write_access, button_id = button_id, message_id = message_id, chat_id = chat_id }