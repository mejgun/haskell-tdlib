-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ViewMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ViewMessages = 
 ViewMessages { force_read :: Bool, message_ids :: [Int], chat_id :: Int }  -- deriving (Show)

instance T.ToJSON ViewMessages where
 toJSON (ViewMessages { force_read = force_read, message_ids = message_ids, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "viewMessages", "force_read" A..= force_read, "message_ids" A..= message_ids, "chat_id" A..= chat_id ]
-- viewMessages ViewMessages  { force_read :: Bool, message_ids :: [Int], chat_id :: Int } 



instance T.FromJSON ViewMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "viewMessages" -> parseViewMessages v
  where
   parseViewMessages :: A.Value -> T.Parser ViewMessages
   parseViewMessages = A.withObject "ViewMessages" $ \o -> do
    force_read <- o A..: "force_read"
    message_ids <- o A..: "message_ids"
    chat_id <- o A..: "chat_id"
    return $ ViewMessages { force_read = force_read, message_ids = message_ids, chat_id = chat_id }