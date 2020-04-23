-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendChatScreenshotTakenNotification where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SendChatScreenshotTakenNotification = 
 SendChatScreenshotTakenNotification { chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON SendChatScreenshotTakenNotification where
 toJSON (SendChatScreenshotTakenNotification { chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendChatScreenshotTakenNotification", "chat_id" A..= chat_id ]

instance T.FromJSON SendChatScreenshotTakenNotification where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendChatScreenshotTakenNotification" -> parseSendChatScreenshotTakenNotification v
   _ -> mempty
  where
   parseSendChatScreenshotTakenNotification :: A.Value -> T.Parser SendChatScreenshotTakenNotification
   parseSendChatScreenshotTakenNotification = A.withObject "SendChatScreenshotTakenNotification" $ \o -> do
    chat_id <- optional $ o A..: "chat_id"
    return $ SendChatScreenshotTakenNotification { chat_id = chat_id }