-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendChatScreenshotTakenNotification where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SendChatScreenshotTakenNotification = 
 SendChatScreenshotTakenNotification { chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SendChatScreenshotTakenNotification where
 toJSON (SendChatScreenshotTakenNotification { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendChatScreenshotTakenNotification", "chat_id" A..= chat_id ]
-- sendChatScreenshotTakenNotification SendChatScreenshotTakenNotification  { chat_id :: Int } 



instance T.FromJSON SendChatScreenshotTakenNotification where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendChatScreenshotTakenNotification" -> parseSendChatScreenshotTakenNotification v
  where
   parseSendChatScreenshotTakenNotification :: A.Value -> T.Parser SendChatScreenshotTakenNotification
   parseSendChatScreenshotTakenNotification = A.withObject "SendChatScreenshotTakenNotification" $ \o -> do
    chat_id <- o A..: "chat_id"
    return $ SendChatScreenshotTakenNotification { chat_id = chat_id }