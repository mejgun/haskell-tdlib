-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResendMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResendMessages = 
 ResendMessages { message_ids :: [Int], chat_id :: Int }  deriving (Show)

instance T.ToJSON ResendMessages where
 toJSON (ResendMessages { message_ids = message_ids, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "resendMessages", "message_ids" A..= message_ids, "chat_id" A..= chat_id ]



instance T.FromJSON ResendMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "resendMessages" -> parseResendMessages v

   _ -> mempty ""
  where
   parseResendMessages :: A.Value -> T.Parser ResendMessages
   parseResendMessages = A.withObject "ResendMessages" $ \o -> do
    message_ids <- o A..: "message_ids"
    chat_id <- o A..: "chat_id"
    return $ ResendMessages { message_ids = message_ids, chat_id = chat_id }